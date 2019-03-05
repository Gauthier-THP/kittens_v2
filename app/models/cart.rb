class Cart < ApplicationRecord
    belongs_to :user
    has_many :cartitems
    has_many :items, through: :cartitems
end
