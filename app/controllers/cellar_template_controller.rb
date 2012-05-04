class CellarTemplateController < ApplicationController
	def index

		# Get the category item that was passed with the previous linked_to
		@cat = Category.find(params[:shelf])
		@cellar_wines = CellarContent.find_all_by_categoryid(@cat.id)
		@wines = []

		@cellar_wines.each do |cellar_wine|
			@wines << Wine.find_by_nummer(cellar_wine.nummer)
		end

	end
end
