FactoryGirl.define do
  factory :item do
    name "Milk"
    group
    trait :purchased do
      purchase
    end
  end
end

