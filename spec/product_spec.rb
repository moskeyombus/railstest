#product_spec.rb
require 'spec_helper'

describe Product do 
	before :each do
		@product = Product.new "Name", "Description", "0.00"
	end

	describe "#new" do
		it "takes 3 parameters and returns a Product object" do
			@product.should be_an_instance_of Product
		end
	end
	describe "#name" do
		it "returns the correct name" do
			@product.name.should eql "Name"
		end
	end
end