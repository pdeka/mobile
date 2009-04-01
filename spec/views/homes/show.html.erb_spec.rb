require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/show.html.erb" do
  include HomesHelper
  before(:each) do
    assigns[:home] = @home = stub_model(Home)
  end

  it "renders attributes in <p>" do
    render
  end
end

