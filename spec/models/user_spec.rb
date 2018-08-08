require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe "#admin?" do
    let!(:user) { FactoryBot.build(:user) }
    let!(:admin) { FactoryBot.build(:user, role: "admin") }

    it "is not an admin if the role is not admin" do
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      expect(admin.admin?).to eq(true)
    end
  end
