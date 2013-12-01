class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:address]

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

    session[:user_id] = @user.id
    data = { :success => 'true' }
    render :json => data, :status => :ok
  end

  private

  def user_params
    params.require(:user).permit(:name,:last_name,:email)
  end
end
