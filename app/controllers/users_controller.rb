class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end
  def new
  end
  def create
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
