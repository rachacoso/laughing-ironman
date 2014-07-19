class FullAuditsController < ApplicationController

	layout :choose_layout

	def show
		@fa = FullAudit.find(params[:id])

	end

	def edit
		@fa = FullAudit.find(params[:id])

	end

	def update

		fa = FullAudit.find(params[:id])

		if fa.background_photo
			puts params[:full_audit][:background_photo]
			fa.background_photo.photo = params[:full_audit][:background_photo]
			fa.background_photo.save!
		else
			fa.create_background_photo(photo: params[:full_audit][:background_photo])
			fa.save!
		end
		

		redirect_to edit_full_audit_path(fa)

	end

	private

	def choose_layout
		case action_name
		when 'show'
			'full_audit'
		when 'edit'
			'admin'
		else
			'application'
		end
	end

end
