class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :categories

  field :name, :type => String
  field :price, :type => BigDecimal, :default => 0.0
  field :stock, :type => Integer, :default => 0
  field :passive, :type => Boolean, :default => false

  def in_stock?
    return self.stock > 0
  end

  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0}
  validates :stock, :numericality => { :only_integer => true }
end
