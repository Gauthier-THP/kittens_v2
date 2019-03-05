class CartitemsController < ApplicationController

  def create

  	@cart_id = current_user.cart.id
   	@item_id = params[:item_id]

  	Cartitem.create(item_id: @item_id, cart_id: @cart_id)

		redirect_to root_path
  end

  def destroy

  	@cart = Cart.find(params[:cart_id])
  	@cartitem = Cartitem.find(params[:id])
		@cartitem.destroy
		
		respond_to do |format|
			format.js
			format.html { redirect_to cart_path(@cart) }
		end

  end
end
