FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name 'John'
    last_name 'Doe'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end

