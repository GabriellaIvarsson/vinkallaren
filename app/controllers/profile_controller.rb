class ProfileController < ApplicationController
  def index

  	#@profile_info = @authorization.user.name;
  	@user_info = $authorization.user.name
  end
end
