FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name 'John'
    last_name 'Doe'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now


    trait :with_group do
      after(:build) do |user|
        group = FactoryGirl.create(:group)
        user.group_users << FactoryGirl.build(:group_user, user: user, group: group)
      end
    end

    trait :with_group_purchase do
      after(:build) do |user|
        group = FactoryGirl.create(:group)
        group_user = FactoryGirl.build(:group_user, user: user, group: group)
        user.group_users << group_user
        FactoryGirl.create(:purchase, group_user: group_user)
      end
    end
  end
end

