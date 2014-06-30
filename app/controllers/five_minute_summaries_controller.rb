class FiveMinuteSummariesController < ApplicationController

	def show
		@fms = FiveMinuteSummary.find(params[:id])

	end


end