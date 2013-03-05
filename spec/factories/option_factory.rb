FactoryGirl.define do

  factory :option, class: Shop::Option do
    name "Test option"
    values ['Test','Test2']
  end
end
