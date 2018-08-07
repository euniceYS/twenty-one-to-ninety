require "rails_helper"

RSpec.describe Api::V1::HabitsController, type: :controller do

  let!(:first_habit) { FactoryBot.create(:habit) }
  let!(:second_habit) { FactoryBot.create(:habit) }
  let!(:admin) { FactoryBot.create(:user, role: "admin") }

  describe "GET#index" do
    it "should return a list of all the habits" do

      sign_in admin

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['habits'].length).to eq 2
      expect(returned_json["habits"][0]["title"]).to eq first_habit.title
      expect(returned_json["habits"][1]["title"]).to eq second_habit.title
    end
  end
end
