class Cart < ApplicationRecord
    belongs_to :user
    has_many :cartitems
    has_many :items, through: :cartitems

    def void
        self.cartitems.each do |cartitem|
            cartitem.destroy
        end  
    end

    def include(applicant_item_id)
        i = 0
        self.items.each do |item|
            if item.id == applicant_item_id 
                 i = i + 1
            end 
            if i == 0 
                return false
            else
                return true
            end
        end 
    end 
end
