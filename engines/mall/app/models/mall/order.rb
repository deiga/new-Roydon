module Mall
  class Order
    include Mongoid::Document
    include Mongoid::Timestamps
    include ActiveModel::ForbiddenAttributesProtection

    before_save :update_prices

    embeds_many :items, class_name: 'OrderItem', inverse_of: :order
    accepts_nested_attributes_for :items
    belongs_to :user, touch: true
    has_one :address

    field :message, type: String
    field :payment, type: String
    field :price, type: Money, default: Money.new(0)
    field :untaxed_price, type: Money , default: Money.new(0)

    validates :payment, inclusion: PAYMENT_TYPES
    validates :address, presence: true

    def add_item(cart_item)
      product = cart_item.product
      vat = product.value_added_tax || ValueAddedTax.new(value: 0)
      items << OrderItem.new(product_id: product.id, product_name: product.name, product_price: product.discounted_price, options: cart_item.selected_option, tax: vat.add_percentage)
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

    def self.build(order_params, cart_items, user, address)
      order = self.new(order_params)
      order.add(cart_items)
      order.user = user
      order.address = address
      return order
    end

    rails_admin do
      configure :price, :decimal do
        pretty_value do
          humanized_money value + ' €'
        end
      end
      configure :untaxed_price, :decimal do
        pretty_value do
          humanized_money value + ' €'
        end
      end
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end
  end
end
