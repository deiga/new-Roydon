class ShoppingBasket
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :products

  def empty
    :products.clear
  end
end
