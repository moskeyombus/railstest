class ImagesController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@image = @product.images.create(params[:image].permit(:title,:location))
		redirect_to product_path(@product)
	end
end
