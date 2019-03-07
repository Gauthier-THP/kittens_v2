class ItemsController < ApplicationController
	  before_action :authenticate_user!, only: [:new]
	  before_action :is_admin, only: [:new]


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

    	

		if  @item.image.attached?

		@item.save
		flash[:success] = "Your item was created !"
		redirect_to root_path			

		else

		flash[:danger] = "Your item was not created. Did you upload a file to create it ?"
		redirect_to new_item_path

		end

	end

	private

	def is_admin

		if current_user.is_admin != true
			flash[:danger] = "You are not an admin and therefore do not have access to this page"
			redirect_to root_path

		end

	end
end
