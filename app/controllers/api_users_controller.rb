class ApiUsersController < ApplicationController
	
	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash.now[:success] = "Congratulations! You're now a member"
			redirect_to '/#/feeds'
		else
			redirect_to 'users/new'
		end
	end

	def show
		unless signed_in?
			render json: {error_message: "Please login to access your profile, or sign up today to create one!"}, status: 401
		else
			render json: {email: current_user.email, join_date: current_user.created_at}.to_json
		end
	end
end