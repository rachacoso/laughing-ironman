class PublicViewsController < ApplicationController

  skip_before_action :require_login, only: [:fms, :fa]

	layout :get_layout

	def fms
		@fms = FiveMinuteSummary.find(params[:id])

	end

	def fa
		@fa = FullAudit.find(params[:id])

	end


  private

  def get_layout
    case action_name
    when "fms"
      "five_minute_summary"
    when "fa"
      "full_audit"
    else
      "application"
    end
  end

end