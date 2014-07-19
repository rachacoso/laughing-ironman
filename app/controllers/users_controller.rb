class UsersController < ApplicationController
	layout "admin"


	def index
		@users = User.all

	end

	def new
		@newuser = User.new

	end

	def create

		if User.where(email: params[:user][:email]).exists?

			flash.now[:notice] = "Someone else is already using that email address"
			@newuser = User.new
			render :new

		elsif params[:user][:email].blank?

			flash.now[:notice] = "Email field cannot be blank"
			@newuser = User.new
			render :new

		elsif params[:user][:password].blank? || params[:user][:password_confirmation].blank?

			flash.now[:notice] = "Password fields can't be blank"
			@newuser = User.new
			render :new

		elsif params[:user][:password] != params[:user][:password_confirmation]

			flash.now[:notice] = "Passwords did not match"
			@newuser = User.new
			render :new

		else

			user = User.new
			user.email = params[:user][:email]
			user.password = params[:user][:password]
			user.password_confirmation = params[:user][:password_confirmation]
			user.save!
			session[:user_id] = user.id.to_s
			redirect_to users_url

		end

	end

	def edit
		@user = User.find(params[:id])
	end

	def update

		@user = User.find(params[:id])		

		case params[:update_type]
		when 'email'

			if User.where(email: params[:user][:email]).exists?
				flash.now[:notice] = "Someone else is already using that email address"
				render :edit

			elsif params[:user][:email].blank?
				flash.now[:notice] = "Email field cannot be blank"
				@newuser = User.new
				render :edit
			else
				flash.now[:notice] = "Email has been changed from #{@user.email} to #{params[:user][:email]}"
				@user.email = params[:user][:email]
				@user.save!
				redirect_to users_path
			end

		when 'password'


		end


	end

	def destroy
		user_to_nix = User.find(params[:id])
		user_to_nix.destroy
		redirect_to users_url, notice: "You have successfully deleted the user #{user_to_nix.email}."
	end


end
