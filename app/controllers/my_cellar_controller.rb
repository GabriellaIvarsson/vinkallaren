class MyCellarController < ApplicationController
	def index
		@cats = Category.all
	end
end
