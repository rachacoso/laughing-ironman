class BackgroundPhotosController < ApplicationController

	def destroy
		img_to_delete = BackgroundPhoto.find(params[:id])
		img_to_delete.destroy
		redirect_to :back

	end

end