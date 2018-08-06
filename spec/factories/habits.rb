FactoryBot.define do
  factory :habit do
    title "Work out 3 times a week"
    body  Faker::DumbAndDumber.quote
    start_date Faker::Date.between(Date.today, 5.days.from_now)
    user
  end
end
