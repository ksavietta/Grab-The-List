FactoryGirl.define do
  factory :purchase do
    group_user
    group
    user
    cost 10

    after(:build) do |purchase|
      purchase.items << FactoryGirl.build(:item, :purchased, purchase: purchase)
    end
  end
end
