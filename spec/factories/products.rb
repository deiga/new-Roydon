FactoryGirl.define do

  trait :test_file do
    image { fixture_file_upload 'files/test%image 1.jpg' }
  end

  factory :product, class: Shop::Product do
    name "Test product"
  end

  # This will use the User class (Admin would have been guessed)
  factory :product_with_image, class: Shop::Product do
    name "Test product with image"
    test_file

    # after_create do |product, proxy|
    #   proxy.file.close
    # end
  end


end
