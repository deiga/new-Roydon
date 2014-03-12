FactoryGirl.define do

  trait :test_file do
    image { fixture_file_upload('spec/fixtures/files/test%image 1.jpg', 'image/jpg') }

    after(:create) do |product, proxy|
      proxy.image.close
    end
  end

  factory :product, class: Mall::Product do
    name "Test product"
    price Money.new(6342)

    factory :product_with_image do
      name "Test product with image"
      test_file
    end

    factory :product_with_options do
      name "Test product with options"

      options {[FactoryGirl.create(:option, name: 'Colour', values: ['Red','Green','Blue'])]}
    end

  end
end
