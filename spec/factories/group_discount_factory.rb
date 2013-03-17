FactoryGirl.define do
  factory :group_discount, class: Shop::GroupDiscount  do
    name "Test group discount"

    factory :group_discount_with_scheme do
      scheme {{5 => Money.new(1000)}}
    end
  end
end
