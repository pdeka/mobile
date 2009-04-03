require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rating_sessions/show.html.erb" do
  include RatingSessionsHelper
  before(:each) do
    assigns[:rating_session] = @rating_session = stub_model(RatingSession,
      :reference_number => 1,
      :channel => "value for channel"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ channel/)
  end
end

