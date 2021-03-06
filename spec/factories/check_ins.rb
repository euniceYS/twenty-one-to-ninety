FactoryBot.define do
  factory :check_in do
    complete { true }
    habit
    check_in_date Faker::Date.between(5.days.ago, Date.today.to_date)
  end
end
