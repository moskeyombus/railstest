class ImagesController < ApplicationController
	before_filter :authenticate_user!, except: [:show]
	def create
		@product = Product.find(params[:product_id])
		@image = @product.images.create(params[:image].permit(:title,:location,:file))
		redirect_to product_path(@product)
	end
	def destroy
	    @product = Product.find(params[:product_id])
	    @image = @product.images.find(params[:id])
	    @image.destroy
	    redirect_to product_path(@product)
  	end
end
