class FiveMinuteSummariesController < ApplicationController

	def show
		@fms = FiveMinuteSummary.find(params[:id])

	end

	def edit
		@fms = FiveMinuteSummary.find(params[:id])

	end

	def update
		
		fms = FiveMinuteSummary.find(params[:id])

		if params[:five_minute_summary][:first_background_photo]
			set_bg_photo(fms, :first_background_photo, params[:five_minute_summary][:first_background_photo])
		end
		if params[:five_minute_summary][:second_background_photo]
			set_bg_photo(fms, :second_background_photo, params[:five_minute_summary][:second_background_photo])
		end
		if params[:five_minute_summary][:third_background_photo]
			set_bg_photo(fms, :third_background_photo, params[:five_minute_summary][:third_background_photo])
		end
		if params[:five_minute_summary][:fourth_background_photo]
			set_bg_photo(fms, :fourth_background_photo, params[:five_minute_summary][:fourth_background_photo])
		end
		if params[:five_minute_summary][:fifth_background_photo]
			set_bg_photo(fms, :fifth_background_photo, params[:five_minute_summary][:fifth_background_photo])
		end 
		
		redirect_to edit_five_minute_summary_path(fms)
	end

end