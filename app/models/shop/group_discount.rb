class Shop::GroupDiscount
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::ForbiddenAttributesProtection

  has_and_belongs_to_many :products, class_name: 'Shop::Product', inverse_of: nil
  has_many :categories, class_name: 'Shop::Category'

  field :name, type: String
  field :scheme, type: Hash

  validates :name, :scheme, presence: true

  def apply_discount_on(cart)
    discountable_products = cart.products.select { |item| products.include?(item) }
    product_count = discountable_products.count
    return nil if product_count < discount_tiers.first

    undiscounted_price = discountable_products.map(&:price).reduce(:+)
    discounted_price, leftover_count = discounted_price_for(product_count)
    undiscounted_price -= discountable_products.first.price * leftover_count
    [discounted_price, undiscounted_price]
  end

  private

    def discount_tiers
      scheme.keys.sort
    end

    def discount_tiers_for(product_count)
      discount_tiers.include?(product_count) ? [product_count] : discount_tiers.select { |key| key < product_count }
    end

    def discounted_price_for(product_count)
      tiers = discount_tiers_for(product_count)
      price = Money.new(0)
      leftover_count = product_count
      begin
        best_applicable_tier = tiers.max
        price += Money.new(scheme[best_applicable_tier][:cents]) # TODO bug in money-rails, https://github.com/RubyMoney/money-rails/issues/90
        leftover_count -= best_applicable_tier
        tiers.delete(best_applicable_tier) unless product_count >= best_applicable_tier
      end while tiers.present?
      [price, leftover_count]
    end

end
