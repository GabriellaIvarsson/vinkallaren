class MyCellarController < ApplicationController
	def index
		@cats = Category.all
		#puts @cats
	end
end
