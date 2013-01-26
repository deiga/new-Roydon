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
    p prod.inspect
    p @item.inspect
    @item.product = prod
    # @item.should be_valid
    p @item.inspect
    @item.save
    p @item.errors
    @item.quantity = 0
    @item.save
    @item.should be_destroyed
    prod.destroy
  end

  specify { @item.should_not be_valid }
end
