class ContentBlocksController < ApplicationController

	def edit
		@block = ContentBlock.find(params[:id])
		@auditname = @block.section.five_minute_summary.audit.name # for display on view
	end

	def update
		block = ContentBlock.find(params[:id])
		block.update!(content_block_params)
		redirect_to five_minute_summary_path(block.section.five_minute_summary)
	end

	def new
		@section = Section.find(params[:sectionid]).id
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
			redirect_to five_minute_summary_path(section.five_minute_summary)
		else 
		  @errors = new_block.errors
    	flash[:notice] = "Sorry there was an error. Your block was not created."
			@section = Section.find(params[:sectionid]).id
			@newblock = ContentBlock.new
			@position = params[:position]
      render action: "new"
    end
	end

	private
  def content_block_params
    params.require(:content_block).permit(
    	:content
		)
  end

end