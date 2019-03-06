class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders

  validates :email, presence: true, uniqueness: true

  after_create :assign_cart_to_new_user

  def assign_cart_to_new_user
    @cart = Cart.create(user: self)
  end 

end
