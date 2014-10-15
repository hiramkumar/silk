class AdminController < ApplicationController
  def login
    if request.post?
      session[:language] = params[:language]
      user = User.authenticate(params[:name], params[:password])
        if user
          session[:user_id] = user.id
          record = LoginDetail.new(:user => session[:user_id],:login =>Time.now.strftime("%Y/%m/%d"),:login_time =>Time.now.strftime("%I:%M:%S"))
          record.save
          redirect_to(:action => "index" )
        else
          flash.now[:notice] = "Invalid user/password combination"
        end
    end
  end

  def logout
    log = LoginDetail.find(:last)
    if log != nil
      log.logout = Time.now.strftime("%Y/%m/%d")
      log.logout_time = Time.now.strftime("%I:%M:%S")
      log.save
    end
    session[:user_id] = nil
    session[:language] = nil
    flash[:notice] = "Logged Out... Please Log In"
    redirect_to(:action => "login" )
  end

  def index
    redirect_to :controller => 'Workers' , :action => 'index'
  end

end
