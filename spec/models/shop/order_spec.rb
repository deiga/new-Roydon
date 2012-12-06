require 'spec_helper'

describe Shop::Order do
  describe "default values, no products" do
    it "should create order" do
      ord = FactoryGirl.build(:order)
      ord.should be_valid
    end
  end

  it "should not be valid with wrong values" do
    invalid_ord = Shop::Order.create
    invalid_ord.should_not be_valid
  end

  describe "with products" do
    it "should create valid order" do
      ord = FactoryGirl.create(:order_with_items)
      ord.should be_valid
    end

    it "should calculate correct price" do
      items = [6500, 6500, 6500, 6500].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price))}
      ord = FactoryGirl.create(:order_with_items, items: items)
      ord.items.should eq items
      ord.should be_valid
      ord.price.should == Money.new(4*6500)
    end

    it "should calculate correct untaxed price" do
      items = [3000].inject([]) { |items, price| items << FactoryGirl.build(:order_item, product_price: Money.new(price), tax: 1.23)}
      ord = FactoryGirl.create(:order_with_items, items: items)
      ord.items.should eq items
      ord.should be_valid
      ord.untaxed_price.should == Money.new(3000/1.23)
    end
  end
end
