# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    name ""
    city ""
    postal_number "00970"
    country ""
    street "Aarteenetsijänkuja 8D 24"
    phone_number "+358445655606"
    description ""
  end
end
