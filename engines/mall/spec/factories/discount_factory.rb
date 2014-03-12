FactoryGirl.define do
  factory :discount, class: Mall::Discount  do
    name "Test discount"
    value 0
  end
end
