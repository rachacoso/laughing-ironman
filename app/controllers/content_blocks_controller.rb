class ContentBlocksController < ApplicationController
	layout "admin"
	
	def edit
		@block = ContentBlock.find(params[:id])
		@audit_subtype = @block.section.five_minute_summary ? 'five_minute_summary' : 'full_audit'
		sharedphotos = InlinePhoto.where(audit_id: nil)
		auditphotos = @block.section.send(@audit_subtype).audit.inline_photos
		@photos = auditphotos + sharedphotos

		case @audit_subtype 	
		when 'five_minute_summary'
			@auditname = @block.section.five_minute_summary.audit.name # for display on view
			@linkto = edit_five_minute_summary_url(@block.section.five_minute_summary)
			@audit_typename = 'Five Minute Summary'
		when 'full_audit'	
			@auditname = @block.section.full_audit.audit.name # for display on view
			@linkto = edit_full_audit_url(@block.section.full_audit)
			@audit_typename = 'Full Audit'
		end

	end

	def update
		if params[:content_block][:content].blank?
			flash[:alert] = "You submitted a blank form. Please enter some content."
			redirect_to edit_content_block_path(params[:id])
		else

			block = ContentBlock.find(params[:id])
			audit_subtype = block.section.five_minute_summary ? 'five_minute_summary' : 'full_audit'
			block.update!(content_block_params)

			case audit_subtype 	
			when 'five_minute_summary'
				redirect_to edit_five_minute_summary_path(block.section.five_minute_summary)
			when 'full_audit'	
				redirect_to edit_full_audit_path(block.section.full_audit)
			end
		end
	
	end

	def new
		@section = Section.find(params[:sectionid])
		@newblock = ContentBlock.new
		@position = params[:position]
		@audit_subtype = @section.five_minute_summary ? 'five_minute_summary' : 'full_audit'
		sharedphotos = InlinePhoto.where(audit_id: nil)
		auditphotos = @section.send(@audit_subtype).audit.inline_photos
		@photos = auditphotos + sharedphotos


		case @audit_subtype 	
		when 'five_minute_summary'
			@auditname = @section.five_minute_summary.audit.name # for display on view
			@linkto = edit_five_minute_summary_url(@section.five_minute_summary)
			@audit_typename = 'Five Minute Summary'			
		when 'full_audit'	
			@auditname = @section.full_audit.audit.name # for display on view
			@linkto = edit_full_audit_url(@section.full_audit)
			@audit_typename = 'Full Audit'			
		end

	end

	def create
		if params[:content_block][:content].blank?
			flash[:alert] = "You submitted a blank form. Please enter some content."
			redirect_to new_content_block_path(params[:sectionid], params[:position])
		else

			section = Section.find(params[:sectionid])
			audit_subtype = section.five_minute_summary ? 'five_minute_summary' : 'full_audit'
			new_block = ContentBlock.create(content_block_params)
			if new_block.valid?
				section.content_blocks << new_block
				section.block_order.insert(params[:position].to_i, new_block.id)
				section.save!
				case audit_subtype 	
				when 'five_minute_summary'
					redirect_to edit_five_minute_summary_path(section.five_minute_summary)
				when 'full_audit'	
					redirect_to edit_full_audit_path(section.full_audit)
				end
			else 
				@errors = new_block.errors
				flash.now[:notice] = "Sorry there was an error. Your block was not created."
				@section = section
				@newblock = ContentBlock.new
				@position = params[:position]
				render action: "new"
	    end

	  end

	end

	def destroy
		block_to_destroy = ContentBlock.find(params[:id])
		parent_section = block_to_destroy.section
		audit_subtype = parent_section.five_minute_summary ? 'five_minute_summary' : 'full_audit'

		parent_section.block_order.delete(block_to_destroy.id)
		parent_section.content_blocks.delete(block_to_destroy)
		parent_section.save

		case audit_subtype 	
		when 'five_minute_summary'
			redirect_to edit_five_minute_summary_path(parent_section.five_minute_summary)
		when 'full_audit'	
			redirect_to edit_full_audit_path(parent_section.full_audit)
		end
		

	end


# CONTENT BLOCK HELPERS

	def cbhelper
		@number = params[:number]
		@headline = params[:headline]
		@fulltext = params[:fulltext]
		@linetext = params[:linetext]
		@helper_type = params[:helper_type]


		# for chart helper
		@chart_title = params[:chart_title]
		@chart_type = params[:chart_type]

		# for image block helper
		@imagelayout = params[:imagelayout]
		if params[:image_a]
			@image_a = InlinePhoto.find(params[:image_a])
		end
		if params[:image_b]
			@image_b = InlinePhoto.find(params[:image_b])
		end
		if params[:image_c]
			@image_c = InlinePhoto.find(params[:image_c])
		end
		@imageblock_caption = params[:imageblock_caption]

		# render template: "content_blocks/#{params[:helper_type]}.html.erb", layout: false
		render layout: false

	end

	private
  def content_block_params
    params.require(:content_block).permit(
    	:content
		)
  end

end