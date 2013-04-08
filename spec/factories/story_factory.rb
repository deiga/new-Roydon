FactoryGirl.define do

  factory :invalid_story, class: Story do

    factory :story do
      title 'Test Story'
      content 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur, eligendi, nulla, amet ipsa tempore veniam mollitia nihil praesentium voluptates officiis facere excepturi explicabo rem cum porro assumenda dolore laborum animi.'
    end
  end
end
