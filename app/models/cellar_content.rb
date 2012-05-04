class CellarContent < ActiveRecord::Base
	belongs_to :user
	validates :uid, :nummer, :category_id, :presence => true
end
