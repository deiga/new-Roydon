FactoryGirl.define do
  factory :discount, class: Shop::Discount  do
    name "Test discount"
    value 0
  end
end
