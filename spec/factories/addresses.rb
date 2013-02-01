# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    name ""
    city ""
    postal ""
    country ""
    street ""
    telephone ""
    description "MyText"
  end
end
