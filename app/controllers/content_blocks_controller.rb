class ContentBlocksController < ApplicationController

	def edit
		@block = ContentBlock.find(params[:id])
		audit_subtype = @block.section.five_minute_summary ? 'fms' : 'fullaudit'

		case audit_subtype 	
		when 'fms'
			@auditname = @block.section.five_minute_summary.audit.name # for display on view
		when 'fullaudit'	
			@auditname = @block.section.full_audit.audit.name # for display on view
		end

	end

	def update
		block = ContentBlock.find(params[:id])
		audit_subtype = block.section.five_minute_summary ? 'fms' : 'fullaudit'

		block.update!(content_block_params)

		case audit_subtype 	
		when 'fms'
			redirect_to edit_five_minute_summary_path(block.section.five_minute_summary)
		when 'fullaudit'	
			redirect_to edit_full_audit_path(block.section.full_audit)
		end
	
	end

	def new
		@section = Section.find(params[:sectionid])
		@newblock = ContentBlock.new
		@position = params[:position]
		audit_subtype = @section.five_minute_summary ? 'fms' : 'fullaudit'

		case audit_subtype 	
		when 'fms'
			@auditname = @section.five_minute_summary.audit.name # for display on view
		when 'fullaudit'	
			@auditname = @section.full_audit.audit.name # for display on view
		end

	end

	def create
		section = Section.find(params[:sectionid])
		audit_subtype = section.five_minute_summary ? 'fms' : 'fullaudit'

		new_block = ContentBlock.create(content_block_params)
		if new_block.valid?
			section.content_blocks << new_block
			section.block_order.insert(params[:position].to_i, new_block.id)
			section.save!

			case audit_subtype 	
			when 'fms'
				redirect_to edit_five_minute_summary_path(section.five_minute_summary)
			when 'fullaudit'	
				redirect_to edit_full_audit_path(section.full_audit)
			end

			
		else 
		  @errors = new_block.errors
    	flash[:notice] = "Sorry there was an error. Your block was not created."
			@section = section
			@newblock = ContentBlock.new
			@position = params[:position]
      render action: "new"
    end
	end

	def destroy
		block_to_destroy = ContentBlock.find(params[:id])
		parent_section = block_to_destroy.section
		audit_subtype = parent_section.five_minute_summary ? 'fms' : 'fullaudit'

		parent_section.block_order.delete(block_to_destroy.id)
		parent_section.content_blocks.delete(block_to_destroy)
		parent_section.save

		case audit_subtype 	
		when 'fms'
			redirect_to edit_five_minute_summary_path(parent_section.five_minute_summary)
		when 'fullaudit'	
			redirect_to edit_full_audit_path(parent_section.full_audit)
		end
		

	end

	def keyfindings

		@number = params[:number]
		@headline = params[:headline]
		@fulltext = params[:fulltext]

		render layout: false

	end

	def simpleformat

		@fulltext = params[:fulltext]

		render layout: false
		# render inline: "<%= simple_format(fulltext) %>"

	end

	private
  def content_block_params
    params.require(:content_block).permit(
    	:content
		)
  end

end