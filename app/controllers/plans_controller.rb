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
    @plans = Plan.all.includes(:user).order(created_at: :desc).page(params[:page])
    @plan = Plan.new
  end

  def new
    @plan = Plan.new
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
