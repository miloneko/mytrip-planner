class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show search]
  before_action :set_q, only: %i[index search]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @categories = Category.where(id: @post.category_ids)
    if @post.save
      flash[:notice] = t('.success')
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all.includes(:user, :categories).order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, notice: t('defaults.message.deleted', item: Post.model_name.human)
  end

  def search
    @results = @q.result(distinct: true).page(params[:page]).per(6)
  end

  def likes
    @like_posts = current_user.like_posts.include(:user).order(created_at: :desc)
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user).page(params[:page])
  end

  def post_params
    params.require(:post).permit(:image, :image_cache, :title, :user, :address, :latitude, :longitude, :location_id, category_ids: [])
  end
end
