class SectionsController < ApplicationController

	def new


	end







	def edit

		@section = Section.find(params[:id])
		@auditname = @section.full_audit.audit.name

	end

	def update
		section = Section.find(params[:id])
		section.display_name = params[:section][:display_name]
		section.save!

		redirect_to edit_full_audit_path(section.full_audit)

	end

	# def update
	# 	audit = Audit.find(params[:id])		
	# 	audit.five_minute_summary.update!(fms_params)

 #    redirect_to edit_five_minute_summary_url(audit)


	# end

	# private
 #  def fms_params
 #    params.require(:five_minute_summary).permit(
 #    	sections_attributes: [ 
 #    		content_blocks_attributes: [
 #    			:content
 #  			] 
	# 		]
	# 	)
 #  end


end