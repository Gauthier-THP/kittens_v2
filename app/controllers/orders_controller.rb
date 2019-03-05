class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(user_id: current_user.id)
    current_user.cart.items.each do |item|  
      Orderitem.create(order_id: @order.id, item_id: item.id)
    end

    if @order.save
      @cart = current_user.cart
      @cart.void
      redirect_to @order
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

end
