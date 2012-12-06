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

    factory :order_with_items do
      items {
        [6500, 12300, 540, 44321].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price))}
      }
    end
  end

  factory :order_item, class: Shop::OrderItem do
    product_name 'Test product'
    product_id Moped::BSON::ObjectId.new
    tax 1.23
  end
end
