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

  def price
    price = 0.0
    self.products.each do |product|
      price += product.price
    end
    price
  end

  def latest_products
    self.products.sort_by(&:updated_at).take(5)
  end
end
