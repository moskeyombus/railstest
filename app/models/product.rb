class Product < ActiveRecord::Base
	has_many :images
	#attr_accessible :name, :description, :price

	validates :name, :presence => true, :uniqueness => true
	validates :price, :presence => true
end
