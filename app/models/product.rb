class Product < ActiveRecord::Base
	attr_accessor :name, :description, :price

	validates :name, :presence => true, :uniqueness => true
	validates :price, :presence => true
end
