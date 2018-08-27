require "rails_helper"

RSpec.describe Api::V1::AdditionalCheckInsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let!(:habit) { FactoryBot.create(:habit, user: user) }

  describe "POST#create" do
    before(:each) do
      sign_in user
    end

    it "creates additional check ins" do
      post_json = {
        title: habit.title,
        body: habit.body,
        start_date: habit.start_date
      }
      prev_count = CheckIn.count
      post(:create, params: {habit_id: habit.id, check_ins: post_json})

      expect(CheckIn.count).to eq(prev_count + 69)
    end
  end
end
