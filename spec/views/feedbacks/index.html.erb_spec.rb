require 'rails_helper'

RSpec.describe "feedbacks/index.html.erb", type: :view do
  it "displays the page title" do
    render
    expect(rendered).to include("<h1>Event Feedback Hub</h1>")
  end
end
