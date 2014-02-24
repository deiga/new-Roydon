require 'spec_helper'

describe Shop::GroupDiscount do
  subject { FactoryGirl.build(:invalid_group_discount)}

  let(:product) { FactoryGirl.create(:product, price: Money.new(350))}
  let(:cart) { FactoryGirl.build(:cart) }

  it { should_not be_valid }

  describe "with scheme" do
    subject(:with_scheme) { FactoryGirl.create(:group_discount) }
    it { should be_valid }

    specify { with_scheme.apply_discount_on(cart.products).should be_nil }
    let(:scheme_threshold) {with_scheme.scheme.keys.sort.first.to_i}

    context "cart with multiple products" do

      before(:each) do
        with_scheme.products << product
      end
      specify "group discount should return new price and old price reduction with even products" do
        1.upto(5) { cart.add product }
        with_scheme.apply_discount_on(cart.products).should eq [Money.new(1000), product.price*scheme_threshold]
      end

      specify "group discount should return new price and old price reduction with uneven products" do
        1.upto(7) { cart.add product }
        with_scheme.apply_discount_on(cart.products).should eq [Money.new(1000), product.price*scheme_threshold]
      end

      specify "group discount should return new price and old price reduction with multiple of threshold" do
        1.upto(10) { cart.add product }
        with_scheme.apply_discount_on(cart.products).should eq [Money.new(2000), product.price*scheme_threshold*2]
      end
    end

    context "product association" do
      specify "adding to products associates with product" do
        with_scheme.products << product
        with_scheme.products.should include(product)
        product.reload.group_discounts.should include(with_scheme)
      end

      specify "adding to group_discounts associates with group_discount" do
        product.group_discounts << with_scheme
        product.group_discounts.should include(with_scheme)
        with_scheme.reload.products.should include(product)
      end
    end
  end
end
