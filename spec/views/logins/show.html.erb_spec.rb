require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logins/show.html.erb" do
  include LoginsHelper
  before(:each) do
    assigns[:login] = @login = stub_model(Login)
  end

  it "renders attributes in <p>" do
    render
  end
end

