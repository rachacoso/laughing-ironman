class HomeController < ApplicationController

	layout :which_layout

	def front



	end


	private

	def which_layout

		if @current_user
			"admin"
    else
      "public"
    end

	end
end
