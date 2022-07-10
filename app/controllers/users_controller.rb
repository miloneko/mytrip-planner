class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = @user.posts.page(params[:page])
    @plans = @user.plans
  end

  def create
    @user = User.new(user_params)
    @categories = Category.where(id: @user.category_ids)
    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache, category_ids: [])
  end
end
