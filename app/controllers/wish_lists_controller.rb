class WishListsController < ApplicationController
  before_action :set_wishlist, only: %i[show destroy edit update]

  def index
    @wishlists = WishList.all
  end

  def new
    @wishlist = WishList.new
  end

  def create
    @wishlist = WishList.new(wishlist_params)
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to wish_list_path(@wishlist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    @wishlist.update(wishlist_params)
    redirect_to wish_lists_path(@wishlists)
  end

  def destroy
    @wishlist.destroy
    redirect_to wish_lists_path
  end

  private

  def set_wishlist
    @wishlist = WishList.find(params[:id])
  end

  def wishlist_params
    params.require(:wish_list).permit(:title)
  end
end
