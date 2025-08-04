require 'rails_helper'

RSpec.describe "feedbacks/index.html.erb", type: :view do
  it "displays the page title" do
    assign(:events, [ Event.new(id: 1, name: "Sample Event") ])
    feedbacks = WillPaginate::Collection.create(1, 3, 0) do |pager|
      pager.replace([])
    end
    assign(:feedbacks, feedbacks)

    render

    expect(rendered).to include("<h1>Event Feedback Hub</h1>")
  end
end
