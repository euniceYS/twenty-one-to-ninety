require "rails_helper"

RSpec.describe Api::V1::HabitsController, type: :controller do

  let!(:admin) { FactoryBot.create(:user, role: "admin") }
  let!(:user) { FactoryBot.create(:user) }
  let!(:first_habit) { FactoryBot.create(:habit, user: user ) }
  let!(:second_habit) { FactoryBot.create(:habit, user: user) }

  describe "GET#index" do
    it "should return a list of all the habits" do
      sign_in user

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["habits"].length).to eq 2
      expect(returned_json["habits"][0]["title"]).to eq first_habit.title
      expect(returned_json["habits"][1]["title"]).to eq second_habit.title
    end
  end

  describe "GET#show" do
    it "should return the details of a specific habit" do
      sign_in user

      get :show, params: { id: first_habit.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json["habit"].length).to eq 7
      expect(returned_json["habit"]).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["habit"]["twenty_one_check_ins"].length).to eq 21
      expect(returned_json["habit"]["additional_check_ins"]).to be_empty
    end
  end

  describe "POST#create" do
    before(:each) do
      sign_in user
    end

    it "creates a new habit" do
      post_json = {
        title: first_habit.title,
        body: first_habit.body,
        start_date: first_habit.start_date
      }
      prev_count = Habit.count
      post(:create, params: {habit: post_json})
      expect(Habit.count).to eq(prev_count + 1)
    end

    it "returns the json of the new habit" do
      post_json = {
        title: first_habit.title,
        body: first_habit.body,
        start_date: first_habit.start_date
      }
      post(:create, params: {habit: post_json})
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      habit = returned_json["habit"]

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)

      expect(habit["title"]).to eq first_habit.title
      expect(habit["daily_check_in"].length).to eq 21
    end
  end
end
