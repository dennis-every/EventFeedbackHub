require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:rating).in_range(1..5) }
    it { should validate_presence_of(:comment) }
  end

  describe 'after_create_commit' do
    let(:event) { Event.create!(name: "Test Event") }

    it 'broadcasts to turbo stream after creation' do
      expect {
        Feedback.create!(event: event, rating: 5, comment: "Excellent!")
      }.to have_broadcasted_to("feedbacks").from_channel("Turbo::StreamsChannel")
    end
  end
end
