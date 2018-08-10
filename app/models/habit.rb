class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :start_date, presence: true

  belongs_to :user
  has_many :check_ins

  after_create :build_check_in

  def build_check_in
    CheckIn.create(habit_id: id)
    # CheckIn.create(habit: self)
  end
end
