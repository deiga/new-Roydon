class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :items,class_name: 'OrderItem', inverse_of: :order
  accepts_nested_attributes_for :items
  belongs_to :user

  def add_item(cart_item)
    product = cart_item.product
    items << OrderItem.new( product_id: product.id, product_name: product.name, product_price: product.price, options: cart_item.selected_option)
  end


end
