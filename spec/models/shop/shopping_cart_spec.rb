require 'spec_helper'

describe Shop::ShoppingCart do

  subject(:cart) { FactoryGirl.create(:cart) }
  let(:product) { FactoryGirl.create(:product, price: Money.new(230), name: 'Test 1') }
  let(:product2) { FactoryGirl.build(:product, price: Money.new(420), name: 'Test 2') }
  let(:product_with_options) { FactoryGirl.build(:product_with_options, price: Money.new(420), name: 'Test 3') }
  it { should be_valid }

  it { should be_empty }

  it "should empty an non-empty cart" do
    cart.add product
    cart.size.should eq 1
  end

  describe "cart size" do
    it "should have size 2 after adding products" do
      cart.add product
      cart.add product2
      cart.size.should eq 2
    end

    it "should have size 2 after incrementing product" do
      cart.add product
      cart.add product
      cart.size.should eq 2
      cart.items.count.should eq 1
    end
  end

  describe "item manipulation" do

    it "should have 1 less item after quantity 0" do
      cart.add product
      cart.add product2
      cart.items.first.quantity = 0
      cart.size.should be 1
    end

    it "should have 2 items after incrementation" do
      cart.add product
      cart.items.first.quantity = 2
      cart.size.should be 2
    end

    it "should have 2 items after incrementation" do
      cart.add product
      cart.items.first.inc(:quantity, 1)
      cart.size.should be 2
    end
  end

  describe "adding to cart" do
    it "should increment quantity if product already in cart w/o options" do
      cart.add product
      cart.add product
      cart.items.first.quantity.should eq 2
    end

    it "should increment quantity if product already in cart w/ options" do
      opt_hash = {product_with_options.options.first.name => product_with_options.options.first.values.first}
      cart.add product_with_options, opt_hash
      cart.add product_with_options, opt_hash
      cart.items.first.quantity.should eq 2
    end
  end

  describe "price calculation" do
    it { cart.price.should eq Money.new(0) }

    it "should have correct price after adding product" do
      cart.add product
      cart.price.should eq product.price
    end

    it "should have correct price after adding 2 products" do
      cart.add product
      cart.add product
      cart.price.should eq product.price*2
    end

    context "with group discount" do
      let(:group_discount) { FactoryGirl.create(:group_discount) }
      let(:scheme_threshold) { group_discount.scheme.keys.sort.first}

      before(:each) do
        group_discount.should_receive(:apply_discount_on).with(cart).and_call_original
        Rails.cache.stub(:write) # RSpec mocks can't be cached, cache.write needs to be stubbed out...
        group_discount.products << product
        product.reload
      end

      it "shouldn't include discount into price with only 1 product" do
        cart.add product
        cart.price.should eq product.price
      end

      it "should include discounted price with exactly :scheme_threshold products" do
        1.upto(scheme_threshold.to_i) do
          cart.add product
        end
        cart.price.should eq Money.new(group_discount.scheme[scheme_threshold][:cents])
      end

      it "should assign @price_modifications" do
        1.upto(scheme_threshold.to_i) do
          cart.add product
        end
        cart.price
        cart.price_modifications.should be_present
      end
    end
  end

end
