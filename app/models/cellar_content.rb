class CellarContent < ActiveRecord::Base
	validates :uid, :categoryid, :nummer, :presence => true
end
