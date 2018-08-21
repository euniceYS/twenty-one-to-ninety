require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe "validations" do
    let(:check_in) { FactoryBot.build(:check_in) }
    let(:check_in1) { FactoryBot.build(:check_in, complete: nil) }
    let(:check_in2) { FactoryBot.build(:check_in, check_in_date: nil) }

    it "is valid with valid attributes" do
      expect(check_in).to be_valid
    end

    it "is not valid without a complete" do
      expect(check_in1).to_not be_valid
    end

    it "is not valid without a check in date" do
      expect(check_in2).to_not be_valid
    end
  end
end
