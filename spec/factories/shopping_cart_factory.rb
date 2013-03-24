FactoryGirl.define do
  factory :cart, class: Shop::ShoppingCart do
  end

  factory :cart_with_product, class: Shop::ShoppingCart do
    items {[FactoryGirl.build(:cart_item)]}
  end

  factory :cart_item, class: Shop::CartItem do
    product FactoryGirl.build(:product)
  end

end
