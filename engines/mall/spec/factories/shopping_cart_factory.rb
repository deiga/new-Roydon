FactoryGirl.define do
  factory :cart, class: Mall::ShoppingCart do
    factory :cart_with_product do
      items {[FactoryGirl.build(:cart_item)]}
    end
  end

end
