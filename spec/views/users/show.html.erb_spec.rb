require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ firstname/)
    response.should have_text(/value\ for\ lastname/)
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ password/)
  end
end

