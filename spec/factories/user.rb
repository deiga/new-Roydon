FactoryGirl.define do

  factory :user do
    first_name "Foo"
    last_name "Bar"
    email "foo@bar.baz"
    password 'foobar'
    password_confirmation 'foobar'
  end
end
