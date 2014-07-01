class SectionsController < ApplicationController

	def edit

		@block = ContentBlock.find(params[:id])

	end

	def update
		audit = Audit.find(params[:id])		
		audit.five_minute_summary.update!(fms_params)

    redirect_to edit_five_minute_summary_url(audit)


	end

	private
  def fms_params
    params.require(:five_minute_summary).permit(
    	sections_attributes: [ 
    		content_blocks_attributes: [
    			:content
  			] 
			]
		)
  end


end