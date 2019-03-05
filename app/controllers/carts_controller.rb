class CartsController < ApplicationController
    
      def show
        @cart = Cart.find(params[:id])
      end
    
      def new
        @cart = Cart.new
      end
    
      def edit
        @cart = Cart.find(params[:id])
      end
    
      def create
        @cart = Cart.new(order_params)
        if @cart.save
          redirect_to @cart
        else
          render :new
        end
      end
    
      def update
        @cart = Cart.find(params[:id])
        if @cart.update(cart_params)
          redirect_to @cart
        else
          render :edit
        end
      end
    
      def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to carts_path
      end

end
