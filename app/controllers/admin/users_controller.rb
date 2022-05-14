class Admin::UsersController < ApplicationController
  before_action :admin_user, only: %i[index destroy]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: '削除しました'
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
