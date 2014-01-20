FactoryGirl.define do
  factory :purchase do
    cost 10
    item
    user_id 1
    group_id 1
  end
end
