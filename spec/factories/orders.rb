FactoryGirl.define do

  factory :order, class: Shop::Order do
    name "Order Tester"
    email "test@tester.org"
    address "Fookuja 12B"
    country "Finland"
    city "Helsinki"
    postal_number "00100"
    payment "Cash"
    phone "0445566505"
  end
end
