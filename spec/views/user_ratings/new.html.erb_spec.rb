require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_ratings/new.html.erb" do
  include UserRatingsHelper
  
  before(:each) do
    assigns[:user_rating] = stub_model(UserRating,
      :new_record? => true,
      :rating => 1,
      :situational_data => "value for situational_data",
      :reference_number => 1,
      :channel => "value for channel"
    )
  end

  it "renders new user_rating form" do
    render
    
    response.should have_tag("form[action=?][method=post]", user_ratings_path) do
      with_tag("input#user_rating_rating[name=?]", "user_rating[rating]")
      with_tag("input#user_rating_situational_data[name=?]", "user_rating[situational_data]")
      with_tag("input#user_rating_reference_number[name=?]", "user_rating[reference_number]")
      with_tag("input#user_rating_channel[name=?]", "user_rating[channel]")
    end
  end
end


