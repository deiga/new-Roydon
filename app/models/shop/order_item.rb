class Shop::OrderItem
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :order

  field :product_id, type: Moped::BSON::ObjectId
  field :product_name, type: String
  field :product_price, type: BigDecimal, default: 0.0
  field :quantity, type: Integer, default: 1
  field :options, type: String

  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0}
  validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }
end
