Given /^the following products are in the cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  @cart ||= Shop::ShoppingCart.find_or_create_by
  table.hashes.each do |product|
    @cart.add Shop::Product.create!(product)
  end
  @cart.size.should == table.hashes.size
end
