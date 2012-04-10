require 'spec_helper'

describe ShoppingCart do
  
  describe "calling empty" do
    it "should do nothing on an empty cart" do
      empty_shopping_cart = ShoppingCart.create!
      empty_shopping_cart.empty
      empty_shopping_cart.size.should be 0
    end

    it "should empty an non-empty cart" do
      cart = ShoppingCart.create!
      cart.add Product.create!(:name => 'Test 42', :price => 2.3)
      cart.size.should be 1
      cart.empty
      cart.size.should be 0
    end
  end
end
