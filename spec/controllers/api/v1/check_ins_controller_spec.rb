require "rails_helper"

RSpec.describe Api::V1::CheckInsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let!(:habit) { FactoryBot.create(:habit, user: user) }

  describe "GET#index" do
    it "should return a list of all the check ins" do
      sign_in user

      get :index, params: {habit_id: 1}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 1
      expect(returned_json["check_ins"][0]["habit_id"]).to eq 1
      expect(returned_json["check_ins"][0]["complete"]).to eq false
    end
  end
end
