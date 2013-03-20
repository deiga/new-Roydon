FactoryGirl.define do
  factory :invalid_group_discount, class: Shop::GroupDiscount  do
    name "Test group discount"

    factory :group_discount do
      scheme {{5 => Money.new(1000)}}
    end
  end
end
