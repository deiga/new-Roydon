require 'spec_helper'

describe Mall::Order do
  describe 'default values, no products' do
    it 'should create order' do
      FactoryGirl.build(:order).should be_valid
    end
  end

  it 'should not be valid with wrong values' do
    Mall::Order.new.should_not be_valid
  end

  it 'should not be valid without address' do
    FactoryGirl.build(:order, address: nil).should_not be_valid
  end

  it 'should have an address attribute' do
    FactoryGirl.build(:order).should respond_to(:address)
  end

  describe 'with products' do
    it 'should create valid order' do
      FactoryGirl.create(:order_with_items).should be_valid
    end

    it 'should calculate correct price' do
      items = [6500, 6500, 6500, 6500].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price))}
      ord = FactoryGirl.create(:order_with_items, items: items)
      ord.items.should eq items
      ord.should be_valid
      ord.price.should == Money.new(4*6500)
    end

    it 'should calculate correct untaxed price' do
      items = [3000].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price), tax: 1.23)}
      ord = FactoryGirl.create(:order_with_items, items: items)
      ord.items.should eq items
      ord.should be_valid
      ord.untaxed_price.should == Money.new(3000/1.23)
    end
  end

  describe 'order factory' do
    it 'should build correct order' do
      user = FactoryGirl.create(:user)
      address = FactoryGirl.create(:address)
      cart_items = [FactoryGirl.create(:item_with_product)]
      order_params = { message: 'Foo', payment: 'Cash' }
      order = Mall::Order.build(order_params, cart_items, user, address)
      order.should be_valid
      order.items.first.product_id.should eq cart_items.first.product.id
      order.user.should eq user
      order.address.should eq address
    end
  end
end
