require 'spec_helper'

describe Shop::CartItem do
  before(:each) do
    @item = Shop::CartItem.new
  end

  after(:each) do
    @item.destroy
  end

  it "should delete item when quantity 0" do
    prod = FactoryGirl.create(:product, name: 'Test 1', price: 4.2)
    @item.product = prod
    @item.should be_valid
    @item.save
    @item.quantity = 0
    @item.save
    @item.should be_destroyed
    prod.destroy
  end

  it "should create valid item" do
    prod = FactoryGirl.create(:product, name: 'Test 1', price: 4.2)
    item = Shop::CartItem.create(product: prod)
    item.should be_valid
    item.save
    prod.destroy
    item.destroy
  end

  specify { @item.single_price = nil; @item.should_not be_valid }
end
