class Item < ActiveRecord::Base
	validates :title, :crit, presence: true
end
