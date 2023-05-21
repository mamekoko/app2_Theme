class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = current_
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end


end
