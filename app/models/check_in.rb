class CheckIn < ApplicationRecord
  validates :complete, inclusion: { in: [true, false] }
  validates :check_in_date, presence: true

  belongs_to :habit
end
