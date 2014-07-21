class MediaLibraryController < ApplicationController
 layout "admin"

	def index
		@audit = Audit.find(params[:audit_id])
		@allphotos = @audit.inline_photos
		@newphoto = InlinePhoto.new
	end

	def show
		@photo = InlinePhoto.find(params[:id])
	end

	def create
		audit = Audit.find(params[:audit_id])
		newphoto = InlinePhoto.new(photo: params[:inline_photo][:photo])
		if newphoto.valid?
			audit.inline_photos << newphoto
		else
			flash[:error] = "Sorry, we're unable to upload that file"
		end
		redirect_to media_library_url

	end

	def destroy
		photo_to_delete = InlinePhoto.find(params[:id])
		photo_to_delete.destroy
		redirect_to :back

	end

end