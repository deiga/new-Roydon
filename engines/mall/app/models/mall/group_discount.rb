module Mall
  class GroupDiscount
    include Mongoid::Document
    include Mongoid::Timestamps
    include ActiveModel::ForbiddenAttributesProtection

    has_and_belongs_to_many :products, class_name: 'Product'
    has_many :categories, class_name: 'Category'

    field :name, type: String
    field :scheme, type: Hash

    validates :name, :scheme, presence: true

    def apply_discount_on(cart_products)
      discountable_products = cart_products.select { |item| products.include?(item) }
      product_count = discountable_products.count
      return nil if product_count < discount_tiers.first.to_i

      undiscounted_price = discountable_products.map(&:price).reduce(:+)
      discounted_price, leftover_count = discounted_price_for(product_count)
      undiscounted_price -= discountable_products.first.price * leftover_count
      [discounted_price, undiscounted_price]
    end

    rails_admin do
      list do
        exclude_fields :_type, :_id, :created_at, :updated_at
      end
    end

    private

    def discount_tiers
      scheme.keys.sort
    end

    def discount_tiers_for(product_count)
      discount_tiers.include?(product_count) ? [product_count.to_s] : discount_tiers.select { |key| key.to_i <= product_count }
    end

    def discounted_price_for(product_count)
      tiers = discount_tiers_for(product_count)
      price_cents = 0
      leftover_count = product_count
      while tiers.any?
        best_applicable_tier = tiers.max
        money_hash = scheme[best_applicable_tier]
        # Need to or these as the first pass has symbols and subsequent passes have strings, because loading from db transforms all to strings
        price_cents += money_hash[:cents] || money_hash['cents'] # TODO bug in money-rails, https://github.com/RubyMoney/money-rails/issues/90
        leftover_count -= best_applicable_tier.to_i
        tiers = discount_tiers_for(leftover_count)
        tiers.delete(best_applicable_tier) unless leftover_count >= best_applicable_tier.to_i
      end
      price = Money.new(price_cents)
      [price, leftover_count]
    end

  end
end
