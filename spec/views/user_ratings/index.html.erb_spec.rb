require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_ratings/index.html.erb" do
  include UserRatingsHelper
  
  before(:each) do
    assigns[:user_ratings] = [
      stub_model(UserRating,
        :rating => 1,
        :situational_data => "value for situational_data",
        :reference_number => 1,
        :channel => "value for channel"
      ),
      stub_model(UserRating,
        :rating => 1,
        :situational_data => "value for situational_data",
        :reference_number => 1,
        :channel => "value for channel"
      )
    ]
  end

  it "renders a list of user_ratings" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for situational_data".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for channel".to_s, 2)
  end
end

