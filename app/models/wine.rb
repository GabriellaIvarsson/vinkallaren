class Wine < ActiveRecord::Base
	validates :nummer, :namn, :presence => true
end
