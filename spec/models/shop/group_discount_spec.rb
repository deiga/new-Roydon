require 'spec_helper'

describe Shop::GroupDiscount do
  subject { FactoryGirl.build(:invalid_group_discount)}

  let(:product) { FactoryGirl.build(:product, price: Money.new(350))}
  let(:cart) { FactoryGirl.build(:cart) }

  it { should_not be_valid }

  describe "with scheme" do
    subject(:with_scheme) { FactoryGirl.build(:group_discount) }
    it { should be_valid }

    specify { with_scheme.apply_discount_on(cart).should be_nil }
    let(:scheme_threshold) {with_scheme.scheme.keys.sort.first}

    context "cart with multiple products" do
      specify "group discount should return new price and old price reduction with even products" do
        1.upto(5) { cart.add product }
        with_scheme.products << product
        with_scheme.apply_discount_on(cart).should eq [Money.new(1000), product.price*scheme_threshold]
      end

      specify "group discount should return new price and old price reduction with uneven products" do
        1.upto(7) { cart.add product }
        with_scheme.products << product
        with_scheme.apply_discount_on(cart).should eq [Money.new(1000), product.price*scheme_threshold]
      end

      specify "group discount should return new price and old price reduction with multiple of threshold" do
        1.upto(10) { cart.add product }
        with_scheme.products << product
        with_scheme.apply_discount_on(cart).should eq [Money.new(2000), product.price*scheme_threshold*2]
      end

    end
  end
end
