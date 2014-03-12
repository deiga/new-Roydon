FactoryGirl.define do
  factory :cart_item, class: Mall::CartItem do
    factory :item_with_product do
      product { FactoryGirl.build(:product) }
    end
  end
end
