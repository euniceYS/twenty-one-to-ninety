# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create Users
User.create!(
  username: "roxy1234",
  email: "roxanne45@gmail.com",
  first_name: "Roxanne",
  last_name: "Cojocariu",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "asmith",
  email: "asmith01@gmail.com",
  first_name: "Alex",
  last_name: "Smith",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "sg",
  email: "sgurung02@gmail.com",
  first_name: "Sarmen",
  last_name: "Gurung",
  role: "user",
  password: "1234qw"
)

# Create habits
Habit.create!(
  body: "Run for 20 mins after work",
  title: "Running",
  start_date: Faker::Date.forward(10),
  user: User.first
)

Habit.create!(
  body: "Spend 15 mins on Duolingo everyday",
  title: "Learn Spanish",
  start_date: Faker::Date.forward(10),
  user: User.second
)

Habit.create!(
  body: "Practice playing piano for 30 mins",
  title: "Play piano",
  start_date: Faker::Date.forward(10),
  user: User.third
)

Habit.create!(
  body: "Read for 30 mins before bed",
  title: "Read fiction",
  start_date: Faker::Date.forward(10),
  user: User.first
)

Habit.create!(
  body: "Spend 30 mins painting",
  title: "Painting",
  start_date: Faker::Date.forward(10),
  user: User.second
)

Habit.create!(
  body: "Check out DIY challenges from Pinterest",
  title: "DIY challenges",
  start_date: Faker::Date.forward(10),
  user: User.second
)

# Check-ins
CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)
CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean(0.2)
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)

CheckIn.create!(
  habit_id: Random.new.rand(19..30),
  complete: Faker::Boolean.boolean
)
