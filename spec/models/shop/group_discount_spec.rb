require 'spec_helper'

describe Shop::GroupDiscount do
  subject { FactoryGirl.build(:group_discount)}

  let(:product) { FactoryGirl.build(:product, price: Money.new(350))}
  let(:cart) { FactoryGirl.build(:cart) }

  it { should_not be_valid }

  describe "with scheme" do
    subject(:with_scheme) { FactoryGirl.build(:group_discount_with_scheme) }
    it { should be_valid }

    specify { with_scheme.apply_discount_on(cart).should be_nil }

    context "group discount and cart with multiple products" do
      before(:each) do
      end

      specify "group discount should return new price and old price reduction" do
        1.upto(5) { cart.add product }
        with_scheme.products << product
        with_scheme.apply_discount_on(cart).should eq [Money.new(1000), product.price*5]
      end
    end
  end
end
