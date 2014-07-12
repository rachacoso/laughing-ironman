class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


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



end
