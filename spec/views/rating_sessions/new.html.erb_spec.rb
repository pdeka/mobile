require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rating_sessions/new.html.erb" do
  include RatingSessionsHelper
  
  before(:each) do
    assigns[:rating_session] = stub_model(RatingSession,
      :new_record? => true,
      :reference_number => 1,
      :channel => "value for channel"
    )
  end

  it "renders new rating_session form" do
    render
    
    response.should have_tag("form[action=?][method=post]", rating_sessions_path) do
      with_tag("input#rating_session_reference_number[name=?]", "rating_session[reference_number]")
      with_tag("input#rating_session_channel[name=?]", "rating_session[channel]")
    end
  end
end


