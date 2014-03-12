# encoding: UTF-8
namespace :shop do

  desc 'Add categories'
  task categories: :environment do
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

  desc 'Add user groups'
  task user_groups: :environment do
    breeder = Mall::UserGroup.create!( name: :breeder )
    groomer = Mall::UserGroup.create!( name: :groomer )
    admin = Mall::UserGroup.create! name: :admin
  end

  desc 'Add test items'
  task products: :environment do
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
  end
end
