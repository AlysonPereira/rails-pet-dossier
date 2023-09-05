class WishListsController < ApplicationController
  def index
    @wishlists = WishList.all
  end

  def new
    @wishlist = WishList.new
  end

  def create
    @wishlist = WishList.new(wishlist_params)
    @wishlist.user = current_user
    if @wishlist.save!
      redirect_to wish_list_path(@wishlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @wishlist = WishList.find(params[:id])
  end

  private

  def wishlist_params
    params.require(:wish_list).permit(:title)
  end
end
