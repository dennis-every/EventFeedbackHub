class Feedback < ApplicationRecord
  after_create_commit do
    broadcast_prepend_to "feedbacks",
      target: "feedbacks",
      partial: "feedbacks/feedback",
      locals: { feedback: self }
  end

  belongs_to :event

  validates :rating, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
