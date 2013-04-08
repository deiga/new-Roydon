require 'spec_helper'

describe Shop::CartItem do

  subject(:item) { FactoryGirl.build(:cart_item) }
  let(:product) { FactoryGirl.create(:product, name: 'Test 1', price: 4.2) }

  it { should_not be_valid }

  describe "with product" do
    subject(:with_product) { FactoryGirl.build(:cart_item, product: product) }

    it { should be_valid }

    it "should delete item when quantity 0" do
      with_product.quantity = 0
      with_product.save.should be_false
      with_product.should be_destroyed
    end
  end

  specify "should not be valid when single_price nil" do
    item.single_price = nil
    item.should_not be_valid
  end

  specify "item should set price before save" do
    item.product = product
    item.single_price.should eq Money.new(0)
    item.save!
    item.single_price.should eq product.price
  end
end
