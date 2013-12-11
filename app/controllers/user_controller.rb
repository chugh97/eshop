require 'digest/sha1'

class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:address]
  before_filter :redirect_if_logged_in, :only => [:new, :create,  :login]

  def new

  end

  def create
    @user = User.new
    @user.name = user_params[:name]
    @user.last_name = user_params[:last_name]
    @user.encrypted_password = user_params[:password]
    @user.email = user_params[:email]
    @user.save!

    redirect_to new_invitation_path(:user => @user)
  end

  def registration
    user_id = params[:user]
    @user = User.find_by(:id => user_id)
  end

  def login
    @user = User.where("email = ? and encrypted_password=? and is_confirmed = true", login_params[:email], Digest::SHA1.hexdigest(login_params[:password]))
    if @user.first
      session[:current_user] = @user.first.id
      redirect_to user_registration_path(:user => @user.first)
    else
      render :new
    end
  end

  def address
    @user = User.find_by(:id => params[:id]);

    params[:addresses].each do |address|
      address_type = AddressType.find_by_description(address[:type])
      @user.addresses << Address.create!(:address_type_id => address_type.id, :user_id => @user.id, :line_1 => address[:line_1], :line_2 => address[:line_2], :town => address[:town], :postcode => address[:postcode], :country => address[:country]);
    end

    params[:phones].each do |phone|
      phone_type = PhoneType.find_by_description(phone[:type])
      @user.phones << Phone.create!(:phone_type_id => phone_type.id, :user_id => @user.id, :phone_number => phone[:number]);
    end

    data = { :success => 'true' }
    render :json => data, :status => :ok
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def redirect_if_logged_in
    if !session[:current_user].nil?
      redirect_to user_registration_path(:user => session[:current_user])
    end
  end

  def user_params
    params.require(:user).permit(:name,:last_name,:email,:password)
  end

  def login_params
    params.require(:user).permit(:email,:password)
  end
end
