class Userconfirmation < ActionMailer::Base
    default from: 'eshop@karazak.com'

    def confirm_email(invitation,user)
      @user = user
      @invitation = invitation
      @url  = "http://localhost:3000/invitation/#{@invitation.invite_code}/confirm"
      mail(to: @invitation.email, subject: 'Please confirm your email address')
    end

end
