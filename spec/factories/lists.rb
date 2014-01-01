FactoryGirl.define do
  factory :list do
    sequence :name do |n|
      "ListName#{n}"
    end
    description 'this is a description'
    price '12.00'
  end
end
