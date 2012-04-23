class SessionsController < ApplicationController

	def new
	end

	def create
		#raise request.env["omniauth.auth"].to_yaml
		auth_hash = request.env['omniauth.auth']
			
			# Check whether an authorization exists for that provider and that uid. If one exists, we welcome our user back.
		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		if @authorization
			#render :text => "Welcome back #{@authorization.user.name}! You have already signed up."

		# If no authorization exists, we sign the user up. We create a new user with the name and email 
		# that the provider (Facebook in this case) gives us, and we associate an authorization with the 
		# provider and the uid we’re given.
		else
			#render :text => "hej"
			user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
			user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save

			#render :text => "Hi #{user.name}! You've signed up."


		end
		redirect_to :home
	end

	def failure
	  	render :text => "Sorry, but you didn't allow access to our app!"
	end

	def destroy
		session[:user_id] = nil
		render :text => "You've logged out!"
	end
end
