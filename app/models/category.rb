class Category < ActiveRecord::Base
	validates :categoryid, :categoryname, :presence => true
end
