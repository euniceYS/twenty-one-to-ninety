require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe "validations" do
    let!(:habit) { FactoryBot.build(:habit) }
    let!(:habit_no_body) { FactoryBot.build(:habit, body: nil) }
    let!(:habit_no_title) { FactoryBot.build(:habit, title: nil) }
    let!(:habit_no_start_date) { FactoryBot.build(:habit, start_date: "A") }

    it "is valid with valid attributes" do
      expect(habit).to be_valid
    end

    it "is valid without a body" do
      expect(habit_no_body).to be_valid
    end

    it "is not valid without a title" do
      expect(habit_no_title).to_not be_valid
    end

    it "is not valid without a start date" do
      expect(habit_no_start_date).to_not be_valid
    end
  end
end
