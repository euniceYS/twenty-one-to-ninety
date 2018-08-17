require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe "validations" do
    let(:habit) { FactoryBot.build(:habit) }
    let(:habit1) { FactoryBot.build(:habit, body: nil) }
    let(:habit2) { FactoryBot.build(:habit, title: nil) }
    let(:habit3) { FactoryBot.build(:habit, start_date: "A") }

    xit "is valid with valid attributes" do
      expect(habit).to be_valid
    end

    xit "is valid without a body" do
      expect(habit1).to be_valid
    end

    xit "is not valid without a title" do
      expect(habit2).to_not be_valid
    end

    xit "is not valid without a start date" do
      expect(habit3).to_not be_valid
    end
  end
end
