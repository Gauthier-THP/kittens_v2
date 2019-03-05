class Item < ApplicationRecord
  has_many :cartitems
  has_many :carts, through: :cartitems
  has_many :orderitems
  has_many :orders, through: :orderitems
end
