class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validate :start_date_cannot_be_in_the_past

  belongs_to :user
  has_many :check_ins, dependent: :destroy

  after_create :build_twenty_one_check_ins

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past.")
    end
  end

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
