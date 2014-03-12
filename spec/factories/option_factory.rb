FactoryGirl.define do

  factory :option, class: Mall::Option do
    name "Test option"
    values ['Test','Test2']
  end
end
