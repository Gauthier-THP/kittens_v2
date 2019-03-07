class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def show
		@item = Item.find_by(title: params[:title])
		unless current_user == nil
			@cart = current_user.cart
		end
	end

	def new

	end

	def create

		@item = Item.new

		@item.title = Faker::Name.first_name
		@item.description = Faker::Lorem.sentence(5)
		@item.price = Faker::Number.decimal(2)
    	@item.image.attach(params[:image])

    	

		if @item.save

		flash[:success] = "Your item was created"
		redirect_to root_path

		else

		flash[:danger] = "Your item was not created"
		redirect_to new_item_path

		end

	end
end
