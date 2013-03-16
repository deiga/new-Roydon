FactoryGirl.define do
  factory :cart, class: Shop::ShoppingCart do
  end

  factory :cart_with_product, class: Shop::ShoppingCart do
    products {[FactoryGirl.build(:product)]}
  end

end
