class HomeController < ApplicationController
  def index
  	@wines = Wine.all
  	#render :text => @wines
  	@random_wine = @wines[rand((@wines.size-1))]
  end
end
