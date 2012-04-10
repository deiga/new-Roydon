class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 9

  has_and_belongs_to_many :categories
  belongs_to :shopping_cart
  has_many :options

  field :name,        :type => String
  field :price,       :type => BigDecimal,  :default => 0.0
  field :stock,       :type => Integer,     :default => 0
  field :passive,     :type => Boolean,     :default => false
  field :suggestion,  :type => Boolean,     :default => false
  field :description, :type => String
  field :image,       :type => String

  def in_stock?
    return self.stock > 0
  end

  validates :name, :presence => true, :length => { :minimum => 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0}
  validates :stock, :numericality => { :only_integer => true }
end
