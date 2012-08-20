class CartItem
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :cart, class_name: 'ShoppingCart', inverse_of: 'items'
  belongs_to :product

  default_scope includes(:product)
  
  field :quantity, type: Integer, default: 1

  def price
    product.price * quantity
  end

end
