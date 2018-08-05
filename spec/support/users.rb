require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:username) {|n| 'majortom#{n}'}
    first_name 'Tom'
    last_name 'Smith'
  end

end
