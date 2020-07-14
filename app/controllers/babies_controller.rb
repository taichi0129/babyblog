class BabiesController < ApplicationController
  before_action :set_baby, only: [:edit, :update]

  def new
    @baby = Baby.new
  end
  
  def create
    @baby = Baby.new(baby_params)
    if @baby.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby.update(baby_params)
    redirect_to user_path(current_user.id)
  end

  private
  def baby_params
    params.require(:baby).permit(:name, :sex, :image, :birthday, :first_weight, :first_height).merge(user_id: current_user.id)
  end

  def set_baby
    @baby = Baby.find(params[:id])
  end
end
