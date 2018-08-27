FactoryBot.define do
  factory :habit do
    title Faker::Habit.name
    body  Faker::DumbAndDumber.quote
    start_date Faker::Date.between(Date.today, 5.days.from_now)
    user
  end
end
