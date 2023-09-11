class ProductsController < ApplicationController
  before_action :set_wishlist, only: %i[new create]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.wish_list = @wishlist
    if @product.save
      redirect_to @wishlist
    else
      render :new, status: :unprocessable_entity
    end
  end

  def searchweb
    keyword = params[:search]
    @webproducts = PetzService.new(keyword).call
    @wishlist = WishList.find(params[:wish_list_id])
    @product = Product.new
  end

  def webcreate
    @wishlist = WishList.find(params[:wish_list_id])
    @product = Product.new(product_params)
    @product.wish_list = @wishlist
    if @product.save
      redirect_to @wishlist
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to wish_list_path(@product.wish_list)
  end

  private

  def set_wishlist
    @wishlist = WishList.find(params[:wish_list_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :url, :local)
  end
end
