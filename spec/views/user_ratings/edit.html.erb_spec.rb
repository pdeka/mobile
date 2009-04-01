require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/user_ratings/edit.html.erb" do
  include UserRatingsHelper
  
  before(:each) do
    assigns[:user_rating] = @user_rating = stub_model(UserRating,
      :new_record? => false,
      :rating => 1,
      :situational_data => "value for situational_data",
      :reference_number => 1,
      :channel => "value for channel"
    )
  end

  it "renders the edit user_rating form" do
    render
    
    response.should have_tag("form[action=#{user_rating_path(@user_rating)}][method=post]") do
      with_tag('input#user_rating_rating[name=?]', "user_rating[rating]")
      with_tag('input#user_rating_situational_data[name=?]', "user_rating[situational_data]")
      with_tag('input#user_rating_reference_number[name=?]', "user_rating[reference_number]")
      with_tag('input#user_rating_channel[name=?]', "user_rating[channel]")
    end
  end
end


