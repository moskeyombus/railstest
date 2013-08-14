class Product < ActiveRecord::Base
	has_many :images, dependent: :destroy
	belongs_to :user

	validates :name, :presence => true, :uniqueness => true
	validates :price, :presence => true
end
