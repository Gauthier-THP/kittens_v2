class Cart < ApplicationRecord
    belongs_to :user
    has_many :cartitems
    has_many :items, through: :cartitems

    def void
        self.cartitems.each do |cartitem|
            cartitem.destroy
        end  
    end
end
