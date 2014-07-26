class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_current_user
  before_action :require_login
 

  def set_bg_photo(fms, this_bgp, set_bgp)
		if fms.send(this_bgp)
			current_bgp = fms.send(this_bgp)
			current_bgp.photo = set_bgp
			current_bgp.save!
		else
			fms.send "#{this_bgp}=", BackgroundPhoto.create(photo: set_bgp)
			fms.save!
		end
  end

	private
  def get_current_user
  	if session[:user_id]
      if session[:expires_at] < Time.current
       session.destroy
       @current_user = nil
       flash[:error] = "Your session has timed out.  Please log in again to continue."
       redirect_to login_url # halts request cycle
      elsif User.find(session[:user_id])
    		@current_user = User.find(session[:user_id])
      else
       session.destroy
       @current_user = nil
      end
  	end
  end
 
  def require_login
    unless @current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

end
