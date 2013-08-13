#product_spec.rb
require 'spec_helper'

describe Product do 

	describe "#new" do
		it "takes 3 parameters and returns a Product object" do
			product = create(:product)
			product.should be_an_instance_of Product
		end

	end
	describe "#name" do
		it "returns the correct name" do
			product = create(:product)
			product.name.should eql "Name"
		end
	end
	describe "#description" do
		it "returns the correct description" do
			product = create(:product)
			product.description.should eql "Description"
		end
	end
	describe "#price" do
		it "returns the correct price" do
			product = create(:product)
			product.price.should eql "0.00"
		end
	end

	it "doesn't allow blank Product names" do
		build(:product, name: "").should have(1).errors_on(:name)
	end

	it "doesn't allow blank Product prices" do
		build(:product, price: "").should have(1).errors_on(:price)
	end
		
end