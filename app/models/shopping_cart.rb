class ShoppingCart
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :products

  delegate :size, :empty?, :to => :products

  def empty
    self.products.clear
  end

  def add(product)
    self.products << product
  end
end
