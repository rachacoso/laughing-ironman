class FiveMinuteSummariesController < ApplicationController

	def show
		@audit = Audit.find(params[:id])

	end

end