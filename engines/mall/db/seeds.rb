# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

puts "Seeding for env '#{Rails.env}'"

def create_categories
  categories_yaml = YAML.load_file('db/seed/categories.yml')
  categories_yaml.each do |top_category, category_list|
    parent = Mall::Category.new(name: top_category)
    parent.save!

    unless category_list.nil?
      category_list.each do |category|
        parent.children.create(name: category)
      end
    end
  end
end

breeder = Mall::UserGroup.create!( name: :breeder )
groomer = Mall::UserGroup.create!( name: :groomer )

User.create!(email: 'test@tester.com', password: 'foofoofoo',
  password_confirmation: 'foofoofoo', first_name: 'Tester',
  last_name: 'Test')

breeder.users.create!(email: 'test2@tester.com', password: 'foofoofoo',
  password_confirmation: 'foofoofoo', first_name: 'Tester',
  last_name: 'Test')

breeder.users.create!(email: 'test3@tester.com', password: 'foofoofoo',
  password_confirmation: 'foofoofoo', first_name: 'Tester',
  last_name: 'Test')

groomer.users.create!(email: '1test@tester.com', password: 'foofoofoo',
  password_confirmation: 'foofoofoo', first_name: 'Tester',
  last_name: 'Test')

groomer.users.create!(email: '2test@tester.com', password: 'foofoofoo',
  password_confirmation: 'foofoofoo', first_name: 'Tester',
  last_name: 'Test')

p "Creating categories"
create_categories()

p "Creating VAT"
vat23 = Mall::ValueAddedTax.create!(value: 23.0, name: 'FI ALV 23%')

p "Creating Options"
colour = Mall::Option.create!(name: 'Colour', values: ['Grey', 'Red', 'Brown', 'Blue'])

p "Creating dummy products"
1.upto(15) do |i|
  test_product = Mall::Product.create!(name: 'Kevytmetallihäkki L', price: Money.new(6500), description:
    "Paino: 5kg<br />93p 57l 62k<br />2-ovinen, muovipohja<br />Saatavana 7 eri värissä.",
    image_url: "http://www.tujomakauppa.net/kuvat/TU4135.jpg", value_added_tax: vat23)
  test_product.options << colour
  test_product.categories << Mall::Category.any_in(name: ['Häkit'])
end

p "All done!"
