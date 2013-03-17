class Shop::GroupDiscount
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  has_and_belongs_to_many :products, class_name: 'Shop::Product', inverse_of: nil
  has_many :categories, class_name: 'Shop::Category'

  field :name, type: String
  field :scheme, type: Hash

  validates :name, :scheme, presence: true

  def apply_price(cart)
    cart_products = cart.products.select {|item| products.include?(item)}
    prod_amount = cart_products.size
    if prod_amount >= scheme.keys.sort.first
      old_price = cart_products.reduce(Money.new(0)) { |sum, prod| sum += prod.price }
      unless prod_amount >= scheme.keys.max
        values = scheme.keys.include?(prod_amount) ? [prod_amount] : scheme.keys.select { |key| key < prod_amount }
      else
        values = scheme.keys
      end
      new_price, prod_amount = apply_scheme(values, prod_amount)
      old_price -= cart_products.first.price * prod_amount
      [new_price, old_price]
    else
      nil
    end
  end

  private

    def apply_scheme(keys, products_amount)
      price = Money.new(0)
      begin
        value = keys.max
        price += Money.new(scheme[value][:cents])
        products_amount -= value
        keys.delete(value) unless products_amount >= value
      end while keys.present?
      [price, products_amount]
    end

end
