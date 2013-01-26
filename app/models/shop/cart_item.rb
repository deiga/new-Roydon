class Shop::CartItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  before_save :destroy_on_empty

  belongs_to :cart, class_name: 'Shop::ShoppingCart', inverse_of: 'items', dependent: :nullify
  belongs_to :product, class_name: 'Shop::Product'

  # default_scope includes(:product)

  field :selected_option, type: Array, default: []
  field :quantity, type: Integer, default: 1
  field :single_price, type: Money, default: Money.new(0)

  validates :product, presence: true
  validates :single_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "Only amounts in the range 0 to 10000.00 are allowed."  }

  def price
    single_price * quantity
  end

  def destroy_on_empty
    if quantity == 0
      destroy
    end
  end

end
