class CartitemsController < ApplicationController

  def create


  	@cart_id = current_user.cart.id

  	puts params
  	puts "$" * 60
  	puts session

  	
  	Cartitem.create(item_id: @item_id, cart_id: @cart_id)

  end



  def destroy

  	@cart = Cart.find(params[:cart_id])
  	@cartitem = Cartitem.find(params[:id])
  	@cartitem.destroy

  	redirect_to cart_path(@cart)
    
  end
end
