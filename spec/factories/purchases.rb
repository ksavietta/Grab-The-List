FactoryGirl.define do
  factory :purchase do
    cost 10
    item
    user
    group
  end
end
