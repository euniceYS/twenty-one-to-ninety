class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :body, length: { maximum: 200,
    too_long: "%{count} characters is the maximum allowed" }
  validates :start_date, presence: true

  belongs_to :user
  has_many :check_ins
end
