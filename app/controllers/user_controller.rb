class UserController < ApplicationController
  def new

  end

  def create
    User.create!(user_params)
    redirect_to products_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:last_name,:email)
  end
end
