require 'rails_helper'

RSpec.describe "Feedbacks", type: :request do
  describe "GET /feedbacks" do
    it "returns http success" do
      get "/feedbacks"
      expect(response).to have_http_status(:success)
      expect(response.media_type).to eq("text/html")
    end
  end
end
