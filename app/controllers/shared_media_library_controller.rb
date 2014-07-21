class SharedMediaLibraryController < ApplicationController
 layout "admin"

	def index
		@allphotos = InlinePhoto.all
		@newphoto = InlinePhoto.new
	end

	def show
		@photo = InlinePhoto.find(params[:id])
	end

	def create
		newphoto = InlinePhoto.new(photo: params[:inline_photo][:photo])
		if newphoto.valid?
			newphoto.save!
		else
			flash[:error] = "Sorry, we're unable to upload that file"
		end
		redirect_to shared_media_library_url

	end

	def destroy
		photo_to_delete = InlinePhoto.find(params[:id])
		photo_to_delete.destroy
		redirect_to :back

	end

end