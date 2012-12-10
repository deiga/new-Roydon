Given /^the following products are in the shopping cart:$/ do |table|
  # table is a Cucumber::Ast::Table
  @cart ||= Shop::ShoppingCart.find_or_create_by
  p @cart.inspect
  p Shop::ShoppingCart.count
  table.hashes.each do |product|
    @cart.add Shop::Product.create!(product)
  end
end
