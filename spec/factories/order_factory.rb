FactoryGirl.define do

  factory :order, class: Shop::Order do
    payment "Cash"
    address { FactoryGirl.create(:address) }
    message "Test order"

    factory :order_with_user do
      user { FactoryGirl.build(:user, first_name: 'Order', last_name: 'Tester', email: 'order@tester.org')}
    end

    factory :order_with_items do
      items {
        [6500, 12300, 540, 44321].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price))}
      }
    end
  end

  factory :order_item, class: Shop::OrderItem do
    product_name 'Test product'
    product_id BSON::ObjectId.new
    tax 1.23
  end
end
