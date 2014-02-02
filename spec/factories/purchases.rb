FactoryGirl.define do
  factory :purchase do
    group_user
    before_create do |purchase|
      FactoryGirl.build(:item, purchase: purchase, group: group_user.group)
    end
    cost 10
    created_at DateTime.new(2001,2,3)


  end
end
