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
    amount_of_products = cart_products.size
    all_keys = scheme.keys
    if amount_of_products >= all_keys.sort.first
      old_price = cart_products.reduce(Money.new(0)) { |sum, prod| sum += prod.price }
      applicable_keys = all_keys
      unless amount_of_products >= all_keys.max
        applicable_keys = all_keys.include?(amount_of_products) ? [amount_of_products] : all_keys.select { |key| key < amount_of_products }
      end
      new_price, amount_of_products = apply_scheme(applicable_keys, amount_of_products)
      old_price -= cart_products.first.price * amount_of_products
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
