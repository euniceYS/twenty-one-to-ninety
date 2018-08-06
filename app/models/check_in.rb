class CheckIn < ApplicationRecord
  validates :complete, inclusion: { in: [true, false] }

  belongs_to :habit
end
