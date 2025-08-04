require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
  end

  describe 'validations' do
    it { should validate_inclusion_of(:rating).in_range(1..5) }
    it { should validate_presence_of(:comment) }
  end
end
