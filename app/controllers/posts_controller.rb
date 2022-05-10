class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      flash[:notice] = t('.success')
    else
      render :new
    end
  end

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :user)
  end
end
