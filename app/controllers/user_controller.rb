class UserController < ApplicationController
  def new

  end

  def create
    @user = User.create!(user_params)
    redirect_to action: "registration", user: @user
  end

  def registration
    user_id = params[:user]
    @user = User.find_by(:id => user_id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:last_name,:email)
  end
end
