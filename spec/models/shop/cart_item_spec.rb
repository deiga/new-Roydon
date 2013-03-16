require 'spec_helper'

describe Shop::CartItem do

  let(:product) { FactoryGirl.create(:product, name: 'Test 1', price: 4.2) }

  it { should_not be_valid }

  describe "with product" do
    subject(:with_product) { Shop::CartItem.create(product: product) }

    it { should be_valid }

    it "should delete item when quantity 0" do
      with_product.quantity = 0
      with_product.save!
      with_product.should be_destroyed
    end
  end

  specify "should not be valid when single_price nil" do
    subject.single_price = nil
    subject.should_not be_valid
  end
end
