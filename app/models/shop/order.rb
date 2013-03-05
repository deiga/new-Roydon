class Shop::Order
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  before_save :update_prices

  PAYMENT_TYPES = ['Credit card', 'Cash']

  embeds_many :items, class_name: 'Shop::OrderItem', inverse_of: :order
  accepts_nested_attributes_for :items
  belongs_to :user
  has_one :address, as: :addressable

  field :message, type: String
  field :payment, type: String
  field :price, type: Money, default: Money.new(0)
  field :untaxed_price, type: Money , default: Money.new(0)

  validates :payment, inclusion: PAYMENT_TYPES

  def add_item(cart_item)
    product = cart_item.product
    vat = product.value_added_tax || Shop::ValueAddedTax.new(value: 0)
    items << Shop::OrderItem.new( product_id: product.id, product_name: product.name, product_price: product.price, options: cart_item.selected_option, tax: vat.add_percentage)
  end

  def update_prices
    items.each do |item|
      self.price += item.price
      self.untaxed_price += item.price / item.tax
    end
  end

  def add(cart_items)
    cart_items.each do |item|
      add_item(item)
    end
  end

end
