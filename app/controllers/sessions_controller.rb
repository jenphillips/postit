class SessionsController < ApplicationController
	def new

	end

	def create
		# ex user.authenticate(password)
		# 1. get user object
		# 2. compare passwords
		# 3. if passwords match, log in
		# 4. if not, re-render form with error

		user = User.find_by(username: params[:username])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You've logged in"
			redirect_to root_path
		else
			flash[:error] = "There's something wrong with your username or password"
			redirect_to register_path
		end
			
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've logged out"
		redirect_to root_path
	end
end
