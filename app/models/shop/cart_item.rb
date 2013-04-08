class Shop::CartItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  before_save :destroy_on_empty, :set_price

  belongs_to :cart, class_name: 'Shop::ShoppingCart', inverse_of: 'items', dependent: :nullify, touch: true
  belongs_to :product, class_name: 'Shop::Product'

  scope :with_product, includes(:product)

  field :selected_option, type: Array, default: []
  field :quantity, type: Integer, default: 1
  field :single_price, type: Money, default: Money.new(0)

  validates :single_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000, message: "Only amounts in the range 0 to 10000.00 are allowed."  }
  validates :product, presence: true

  def price
    single_price * quantity
  end

  private

    def destroy_on_empty
      if quantity == 0
        self.destroy
        false
      end
    end

    def set_price
      self.single_price = product.price unless single_price > Money.new(0)
    end
end
