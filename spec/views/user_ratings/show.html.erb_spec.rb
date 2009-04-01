require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_ratings/show.html.erb" do
  include UserRatingsHelper
  before(:each) do
    assigns[:user_rating] = @user_rating = stub_model(UserRating,
      :rating => 1,
      :situational_data => "value for situational_data",
      :reference_number => 1,
      :channel => "value for channel"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ situational_data/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ channel/)
  end
end

