require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/index.iphone.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:homes] = [
      stub_model(Home),
      stub_model(Home)
    ]
  end

  it "renders a list of homes" do
    render
  end
end

