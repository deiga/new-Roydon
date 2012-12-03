FactoryGirl.define do

  trait :test_file do
    image { fixture_file_upload 'spec/fixtures/files/test%image 1.jpg' }

    after(:create) do |product, proxy|
      proxy.image.close
    end
  end

  factory :product, class: Shop::Product do
    name "Test product"
  end

  # This will use the User class (Admin would have been guessed)
  factory :product_with_image, class: Shop::Product do
    name "Test product with image"
    test_file


  end

  factory :product_with_options, class: Shop::Product do
    name "Test product with options"

    after(:build) do |product|
      product.options << FactoryGirl.create(:option, name: 'Colour', values: ['Red','Green','Blue'])
    end
  end

end
