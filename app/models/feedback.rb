class Feedback < ApplicationRecord
  belongs_to :event

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
