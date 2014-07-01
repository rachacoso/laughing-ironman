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
		@newblock = ContentBlock.new
	end

	private
  def content_block_params
    params.require(:content_block).permit(
    	:content
		)
  end

end