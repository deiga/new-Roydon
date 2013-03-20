class Shop::ShoppingCart
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  has_many :items, class_name: 'Shop::CartItem', inverse_of: :cart, dependent: :destroy

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
    options = {} if options.nil?
    product = Shop::Product.find(product) unless product.class == Shop::Product
    new_options = options.inject([]) {|x,y| x << y.join(': ')} # Option array in the form ['Option name': 'Option value', ...]
    existing_item = self.items.to_a.find { |x| x.product == product && x.selected_option == new_options}
    if existing_item
      existing_item.inc(:quantity, 1)
    else
      self.items << Shop::CartItem.create!(product: product, selected_option: new_options)
    end
  end

  def remove_item(cart_item_id)
    item_to_remove = Shop::CartItem.find(cart_item_id) unless cart_item_id.blank?
    items.delete(item_to_remove)
  end

  def price
    price = Money.new(0)
    self.items.each do |item|
      price += item.price
    end
    group_discounts = items.map(&:product).map(&:group_discounts).flatten
    if group_discounts.any?
      group_discounts.each do |group_discount|
        price_modification = group_discount.apply_discount_on(self) # TODO remove passing cart and pass products instead
        price += price_modification.inject(:-) unless price_modification.nil?
      end
    end
    price
  end

  def latest_items
    self.items.with_product.order_by(:updated_at.desc).limit(5)
  end

  def products
    items.reduce([]) { |memo, item| (memo << item.product) * item.quantity }
  end
end
