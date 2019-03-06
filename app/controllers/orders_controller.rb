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
    @order = Order.create(user_id: current_user.id, amount:0, status: "unpaid")
    current_user.cart.items.each do |item|  
      Orderitem.create(order_id: @order.id, item_id: item.id)
      @order.amount = @order.amount + item.price
    end
    

    if @order.save
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
