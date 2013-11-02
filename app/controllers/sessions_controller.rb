class SessionsController < ApplicationController
	def new
		flash.now[:danger] = "Please login or sign up to access your profile and feed." if params[:error].eql? '401'
	end

	def create
		@user = User.find_by_email(params[:email].downcase)
		if(@user && @user.authenticate(params[:password]))
			sign_in @user
			redirect_to '/#/feeds'
		else
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		flash.now[:success] = "Successfully signed out"
		render 'new'
	end
end