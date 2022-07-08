class PlansController < ApplicationController
  def create
    @plan = current_user.plans.build(plans_parameter)
    if @plan.save
      redirect_to plans_path, notice: "作成しました"
    else
      render :new
    end
  end

  def index
    @plans = current_user.plans.order(created_at: :desc).page(params[:page])
  end

  def new
    @plan = Plan.new
    @user = User.find(current_user.id)
    @like_posts = @user.like_posts.order(created_at: :desc)
    @samples = Sample.all
    @posts = Post.last
    @postcategories = PostCategory.last.post
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path, notice: "削除しました"
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plans_parameter)
      redirect_to plans_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def plans_parameter
    params.require(:plan).permit(:title, :start_time, :end_time, :body, :address)
  end
end
