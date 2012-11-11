class CartItem
  include Mongoid::Document
  include Mongoid::Timestamps

  before_save :destroy_on_empty

  belongs_to :cart, class_name: 'ShoppingCart', inverse_of: 'items'
  belongs_to :product

  default_scope includes(:product)

  field :selected_option, type: Array
  field :quantity, type: Integer, default: 1

  def price
    product.price * quantity
  end

  def destroy_on_empty
    if self.quantity == 0
      self.destroy
    end
  end

end
