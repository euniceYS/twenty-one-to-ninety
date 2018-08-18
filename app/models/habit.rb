class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :start_date, presence: true
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

  def build_additional_check_ins(new_dates, habit)
    new_dates.each do |date|
      CheckIn.create!(habit: habit, check_in_date: date)
    end
  end

  def make_to_ninety_days(check_ins)
    next_challenge_date = check_ins.last.check_in_date
    check_ins_dates = [ next_challenge_date + 1 ]
    68.times do |n|
      check_ins_dates << next_challenge_date.next_day(n)
    end
    return check_ins_dates
  end

  def daily_check_in
    unless check_ins.empty?
      check_ins.each do |today|
        if today["check_in_date"] == Date.today
          return today.as_json(only: [:id, :complete, :check_in_date])
        end
      end
    end
  end
end
