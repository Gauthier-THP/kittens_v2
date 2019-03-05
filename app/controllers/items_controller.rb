class ItemsController < ApplicationController

	def index
		@items = Item.all

	end

	def show
		@item = Item.find(params[:id])
		@cart = current_user.cart

		puts "$" * 60
		puts params
		puts "$" * 60
		params[:item_id] = @item.id
		puts params
	end
end
