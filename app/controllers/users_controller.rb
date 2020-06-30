class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
  end

  def new
  end
  def create
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_path(@user.id)
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :image)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
