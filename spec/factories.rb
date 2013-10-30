FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Firstname #{n}" }
    sequence(:last_name) { |n| "Lastname #{n}" }
    sequence(:username) { |n| "username_#{n}" }
    sequence(:email) { |n| "user.#{n}@example.com" }
    sequence(:extension) { |n| fixed_length_random(5) }
  end
end