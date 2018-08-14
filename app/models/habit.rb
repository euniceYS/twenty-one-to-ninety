class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :start_date, presence: true

  belongs_to :user
  has_many :check_ins, dependent: :destroy

  after_create :build_twenty_one_check_ins

  def build_twenty_one_check_ins
    twenty_one_days.each do |date|
      CheckIn.create!(habit_id: id, check_in_date: date)
    end
  end

  def twenty_one_days
    check_ins_dates = []
    21.times do |n|
      check_ins_dates << start_date.next_day(n)
    end

    return check_ins_dates
  end
end
