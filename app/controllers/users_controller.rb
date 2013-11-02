class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		if signed_in?
			render partial: 'users/show' 
		else
			render nothing: true, status: 200
		end
	end

end