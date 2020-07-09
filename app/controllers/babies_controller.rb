class BabiesController < ApplicationController
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

  private
  def baby_params
    params.require(:baby).permit(:name, :sex, :image, :birthday, :first_weight, :first_height).merge(user_id: current_user.id)
  end
end
