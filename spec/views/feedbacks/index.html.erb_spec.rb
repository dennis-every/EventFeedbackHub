require 'rails_helper'

RSpec.describe "feedbacks/index.html.erb", type: :view do
  it "displays the page title" do
    assign(:events, [ Event.new(id: 1, name: "Sample Event") ])
    assign(:feedbacks, [])

    render

    expect(rendered).to include("<h1>Event Feedback Hub</h1>")
  end
end
