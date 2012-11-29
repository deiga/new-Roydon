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

  def add(product_id, options = {})
    options = {} if options.nil?
    product_id = product_id.id if product_id.class == Shop::Product
    product_id = product_id.to_s
    new_options = options.inject([]) {|x,y| x << y.join(': ')}
    new_item = Shop::CartItem.new(product: product_id, selected_option: new_options)
    existing_item = self.items.includes(:product).to_a.find { |x| x.product_id.to_s == product_id &&  x.selected_option == new_item.selected_option}
    unless existing_item.nil?
      existing_item.inc(:quantity, 1)
    else
      self.items << new_item
    end
  end

  def price
    price = Money.new(0)
    self.items.each do |item|
      price += item.price
    end
    price
  end

  def latest_items
    self.items.includes(:product).sort_by(&:updated_at).take(5)
  end
end
