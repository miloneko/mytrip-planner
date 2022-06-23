class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i[show edit update]

  def show
    @posts = @user.posts
    @posts = @user.posts.order(created_at: :desc)
    @like_posts = @user.like_posts.order(created_at: :desc).page(params[:page]).per(8)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
