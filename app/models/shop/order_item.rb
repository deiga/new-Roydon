class Shop::OrderItem
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :order, class_name: 'Shop::Order'

  field :product_id, type: Moped::BSON::ObjectId
  field :product_name, type: String
  field :product_price, type: Money, default: Money.new(0)
  field :quantity, type: Integer, default: 1
  field :options, type: Array
  field :tax, type: Float

  validates :product_name, :presence => true, :length => { :minimum => 1 }
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
  validates :price, numericality: { allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "Only amounts in the range 0 to 10000.00 are allowed."  }
end
