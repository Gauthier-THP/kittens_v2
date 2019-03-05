class Item < ApplicationRecord
    validates :image_url, presence: true
    validates :price, presence: true
    validates :title, presence: true
end
