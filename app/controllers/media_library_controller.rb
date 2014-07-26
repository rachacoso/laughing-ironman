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
		if params[:inline_photo]
			newfile = params[:inline_photo][:photo]
		end

		if newfile.nil?
			flash[:error] = "Sorry, Please choose a file to upload"
		else
			newphoto = InlinePhoto.new(photo: newfile)
			if newphoto.valid?
				audit.inline_photos << newphoto
			else
				flash[:error] = "Sorry, we're unable to upload that file"
			end
		end
		redirect_to media_library_url

	end

	def destroy
		photo_to_delete = InlinePhoto.find(params[:id])
		photo_to_delete.destroy
		redirect_to :back

	end

end