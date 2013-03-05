FactoryGirl.define do

  factory :order, class: Shop::Order do
    user { FactoryGirl.build(:user, first_name: 'Order', last_name: 'Tester', email: 'order@tester.org')}
    payment "Cash"
    address { FactoryGirl.build(:address) }
    message ""


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
