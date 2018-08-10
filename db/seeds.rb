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
  email: "roxanne45@test.com",
  first_name: "Roxanne",
  last_name: "Cojocariu",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "asmith",
  email: "asmith01@test.com",
  first_name: "Alex",
  last_name: "Smith",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "sarmenG",
  email: "sgurung02@test.com",
  first_name: "Sarmen",
  last_name: "Gurung",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "choiya19",
  email: "choiya19@test.com",
  first_name: "Alicia",
  last_name: "Choi",
  role: "user",
  password: "1234qw"
)

User.create!(
  username: "echoi06",
  email: "echoi06@test.com",
  first_name: "Eunice",
  last_name: "Choi",
  role: "user",
  password: "1234qw"
)
