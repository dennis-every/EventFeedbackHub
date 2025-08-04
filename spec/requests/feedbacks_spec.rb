require 'rails_helper'

RSpec.describe "Feedbacks", type: :request do
  describe "GET /feedbacks" do
    it "returns http success" do
      get "/feedbacks"
      expect(response).to have_http_status(:success)
      expect(response.media_type).to eq("text/html")
    end
  end

  describe "POST /feedbacks" do
    let!(:event) { Event.create!(name: "Test Event") }

    it "creates a new feedback and responds with turbo_stream" do
      post "/feedbacks", params: {
        feedback: {
          event_id: event.id,
          rating: 5,
          comment: "Great event!"
        }
      }, headers: {
        "Accept" => "text/vnd.turbo-stream.html"
      }

      expect(response).to have_http_status(:success)
      expect(response.media_type).to eq("text/vnd.turbo-stream.html")
    end
  end
end
