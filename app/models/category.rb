class Category < ActiveRecord::Base
	validates :category_id, :category_name, :presence => true
end
