FactoryGirl.define do
  factory :group do
    name 'GroupTest'


    trait :with_unpurchased do
      item
    end
  end
end
