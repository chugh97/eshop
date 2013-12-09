class InvitationController < ApplicationController

  def new
    get_user
    @invitation = Invitation.new
    @invitation.email = @user.email
    @invitation.issued_at = DateTime.now
    @invitation.invite_code = create_invite_code
    @invitation.save

    Userconfirmation.confirm_email(@invitation, @user).deliver
    flash[:notice] = "Confirmation email sent. Please check your email!"
    redirect_to newuser_path
  end

  def confirm
    invite = Invitation.find_by_invite_code(params[:id])
    user = User.find_by_email(invite.email)
    user.is_confirmed = true
    user.save
    flash[:notice] = "Your email is confirmed. Please Sign in....."
    redirect_to newuser_path
  end

  private
  def get_user
    user_id = params[:user]
    @user = User.find_by(:id => user_id)
  end

  def create_invite_code
    SecureRandom.urlsafe_base64
  end
end
