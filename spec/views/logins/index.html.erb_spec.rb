require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logins/index.iphone.erb" do
  include LoginsHelper
  
  before(:each) do
    assigns[:logins] = [
      stub_model(Login),
      stub_model(Login)
    ]
  end

  it "renders a list of logins" do
    render
  end
end

