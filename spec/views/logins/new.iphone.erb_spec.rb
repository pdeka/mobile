require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logins/new.iphone.erb" do
  include LoginsHelper
  
  before(:each) do
    assigns[:login] = stub_model(Login,
      :new_record? => true
    )
  end

  it "renders new login form" do
    render
    
    response.should have_tag("form[action=?][method=post]", logins_path) do
    end
  end
end


