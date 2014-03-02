class Shop::OrderItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  embedded_in :order, class_name: 'Shop::Order'

  field :product_id, type: BSON::ObjectId
  field :product_name, type: String
  field :product_price, type: Money, default: Money.new(0)
  field :quantity, type: Integer, default: 1
  field :options, type: Array
  field :tax, type: Float, default: 0.0

  validates :product_name, presence: true, length: { minimum: 1 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :product_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "Only amounts in the range 0 to 10000.00 are allowed."  }
  validates :tax, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 2.0}

  def price
    product_price * quantity
  end

  rails_admin do
    list do
      exclude_fields :_type, :_id, :created_at, :updated_at
    end
  end

end
