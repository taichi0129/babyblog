class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :followings, :followers]

  def index
    @user = User.find(current_user.id)
  end

  def new
  end
  def create
  end

  def show
    @babies = @user.babies
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def followings
    @users = @user.followings
    render 'show_followings'
  end

  def followers
    @users = @user.followers
    render 'show_followers'
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
