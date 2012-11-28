class Shop::ShoppingCart
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :items, class_name: 'Shop::CartItem', inverse_of: :cart

  delegate :empty?, :to => :items

  accepts_nested_attributes_for :items

  def empty
    self.items.clear
  end

  def size
    self.items.inject(0) do|result, item|
      result += item.quantity
    end
  end

  def add(product, options = {})
    self.items << Shop::CartItem.new(product: product, selected_option: options.inject([]) {|x,y| x << y.join(': ')})
  end

  def price
    price = Money.new(0)
    self.items.each do |item|
      price += item.price
    end
    price
  end

  def latest_items
    self.items.sort_by(&:updated_at).take(5)
  end
end
