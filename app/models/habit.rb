class Habit < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :start_date, presence: true

  belongs_to :user
  has_many :check_ins

end
