class ItemsController < ApplicationController

	def index
		@items = Item.all
		puts current_user.cart.id
		puts "$" * 60
	end

	def show
		@item = Item.find(params[:id])
	end
end
