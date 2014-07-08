class ContentBlocksController < ApplicationController

	def edit
		@block = ContentBlock.find(params[:id])
		@auditname = @block.section.five_minute_summary.audit.name # for display on view
	end

	def update
		block = ContentBlock.find(params[:id])
		block.update!(content_block_params)
		redirect_to edit_five_minute_summary_path(block.section.five_minute_summary)
	end

	def new
		@section = Section.find(params[:sectionid])
		@newblock = ContentBlock.new
		@position = params[:position]
	end

	def create
		section = Section.find(params[:sectionid])
		new_block = ContentBlock.create(content_block_params)
		if new_block.valid?
			section.content_blocks << new_block
			section.block_order.insert(params[:position].to_i, new_block.id)
			section.save!
			redirect_to edit_five_minute_summary_path(section.five_minute_summary)
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
		parent_section.block_order.delete(block_to_destroy.id)
		parent_section.content_blocks.delete(block_to_destroy)
		parent_section.save
		redirect_to edit_five_minute_summary_path(parent_section.five_minute_summary)

	end


	private
  def content_block_params
    params.require(:content_block).permit(
    	:content
		)
  end

end