require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rating_sessions/index.html.erb" do
  include RatingSessionsHelper
  
  before(:each) do
    assigns[:rating_sessions] = [
      stub_model(RatingSession,
        :reference_number => 1,
        :channel => "value for channel"
      ),
      stub_model(RatingSession,
        :reference_number => 1,
        :channel => "value for channel"
      )
    ]
  end

  it "renders a list of rating_sessions" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for channel".to_s, 2)
  end
end

