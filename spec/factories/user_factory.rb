FactoryGirl.define do

  factory :user do
    first_name "Foo"
    last_name "Bar"
    email "foo@bar.baz"
    password 'foobarbaz'
    password_confirmation 'foobarbaz'

    factory :user_with_order do
      orders  { [FactoryGirl.build(:order)] }
    end
  end
end
