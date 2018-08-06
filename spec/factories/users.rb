require 'factory_bot'

FactoryBot.define do
  factory :user do
    first_name 'Tom'
    last_name 'Smith'
    sequence(:username) {|n| 'majortom#{n}'}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

end
