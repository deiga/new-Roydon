class ShoppingCart
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :items, class_name: 'CartItem', inverse_of: :cart

  delegate :size, :empty?, :to => :items

  def empty
    self.items.clear
  end

  def add(product)
    self.items << CartItem.new(product: product)
  end

  def price
    price = 0.0
    self.items.each do |item|
      price += item.price
    end
    price
  end

  def latest_items
    self.items.sort_by(&:updated_at).take(5)
  end
end
