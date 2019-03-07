class CartitemsController < ApplicationController
  before_action :authenticate_user!
  
  def create

  	@cart_id = current_user.cart.id
   	@item_id = params[:item_title]
    Cartitem.create(item_id: @item_id, cart_id: @cart_id)
    flash[:success] = "Added to Cart!"
		redirect_to root_path
  end

  def destroy

    #declaration of the variable necessary to destroy and item and calculate its new total
  	@cart = Cart.find(params[:cart_id])
  	@cartitem = Cartitem.find(params[:id])

#---------------------------------------------------
    #Calculation  of the total price when an item is deleted in the cart
    
    price_cartitem = @cartitem.item.price

    allcartitems = @cart.cartitems 

    items_price = []

    allcartitems.each do |cartitem|

      items_price << cartitem.item.price

    end

    @new_total = items_price.sum - price_cartitem
    #end of the calculation
#------------------------------------------------
    #cart number of item navbar
    @length = @cart.items.length - 1

#------------------------------------------------
    #destruction of an item in the cart
		@cartitem.destroy
		
		respond_to do |format|
			format.js
			format.html { redirect_to cart_path(@cart) }
		end

  end
end
