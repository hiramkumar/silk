class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"
 
  def welcome_email(user)
    @user_mail = user
    @url  = "http://example.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site") do |format|
      format.html { render 'another_template' }
      format.text { render :text => 'Render text' }
    end
  end
end
