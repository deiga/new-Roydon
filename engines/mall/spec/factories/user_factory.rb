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

    factory :admin do
      user_groups { [FactoryGirl.create(:admin_group)] }
    end
  end

  factory :group, class: Mall::UserGroup do

    factory :admin_group do
      name 'admin'
    end
  end
end
