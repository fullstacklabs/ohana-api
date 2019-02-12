FactoryGirl.define do
  factory :blog_post do
    title 'Test Blog post'
    posted_at '2019-01-06 18:30:00'
    body 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    is_published false
    image_legend 'Test image legend'
    admin

    trait :soccer do
      after(:create) { |post| post.update_attributes(category_list: 'soccer') }
    end
  end
end
