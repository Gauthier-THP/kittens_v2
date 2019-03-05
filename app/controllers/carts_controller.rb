class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :user_match, only: [:show]  

      def show
        @cart = Cart.find(params[:id])
      end
    
      def new
        @cart = Cart.new
      end
    
      def editConnexion
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

      def user_match
        @cart = Cart.find(params[:id])
        @currentusercart = current_user.cart
        if @cart.id != @currentusercart.id
          redirect_to root_path
        end
      end

end
