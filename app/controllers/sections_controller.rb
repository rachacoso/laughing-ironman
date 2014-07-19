class SectionsController < ApplicationController

	def new


		@fa = FullAudit.find(params[:full_audit_id])
		@newsection = Section.new
		@position = params[:position]

	end


	def create

		fa = FullAudit.find(params[:full_audit_id])
		newsection = Section.new(section_type: 'full_audit_section', display_name: params[:section][:display_name])

		if newsection.valid?
			
			newsection.save!
			newsection.setcontent
			fa.sections << newsection
			fa.section_order.insert(params[:position].to_i, newsection.id)
			fa.save!
			redirect_to edit_full_audit_path(fa)

		else
		  @errors = newsection.errors
    	flash.now[:notice] = "Sorry there was an error. Your section was not created."
			@fa = FullAudit.find(params[:full_audit_id])
			@newsection = Section.new
			@position = params[:position]
      render action: "new"
		end

	end

	def destroy
		section_to_destroy = Section.find(params[:id])
		parent_full_audit = section_to_destroy.full_audit
		parent_full_audit.section_order.delete(section_to_destroy.id)
		parent_full_audit.sections.delete(section_to_destroy)
		parent_full_audit.save
		redirect_to edit_full_audit_path(parent_full_audit)
	end

	def edit

		@section = Section.find(params[:id])
		@auditname = @section.full_audit.audit.name

	end

	def update
		section = Section.find(params[:id])
		section.update!(section_params)
		redirect_to edit_full_audit_path(section.full_audit)

	end

	private
  def section_params
    params.require(:section).permit(
    	:display_name
		)
  end


end