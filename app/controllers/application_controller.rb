# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize, :except => [:login, :logout]
  before_filter :session_expiry, :except => :login
  before_filter :update_session_time, :except => [:login, :logout]
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => '72d005b8aa1acd8a12d46ff3f6cfd5c1'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  protected
    def authorize
      #raise session[:user_id].inspect
      unless User.find_by_id(session[:user_id])
        flash[:notice] = "Please log in"
        redirect_to :controller => 'admin' , :action => 'logout'
      end
    end
   
    def session_expiry
    if session[:expires_at]
      @time_left = (session[:expires_at] - Time.now).to_i 
      unless @time_left > 0
        reset_session
        flash[:notice] = "Session Expired"
        redirect_to( :controller =>'/admin', :action => 'logout') 
      end 
    end
  end
  def update_session_time
    session[:expires_at] = 15.minutes.from_now
  end
  

end
