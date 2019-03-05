class Item < ApplicationRecord

  has_many :cartitems
  has_many :carts, through: :cartitems
  has_many :orderitems
  has_many :orders, through: :orderitems
  validates :image_url, presence: true
  validates :price, presence: true
  validates :title, presence: true

end
