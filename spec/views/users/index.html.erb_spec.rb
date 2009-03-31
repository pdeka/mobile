require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :firstname => "value for firstname",
        :lastname => "value for lastname",
        :username => "value for username",
        :password => "value for password"
      ),
      stub_model(User,
        :firstname => "value for firstname",
        :lastname => "value for lastname",
        :username => "value for username",
        :password => "value for password"
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for firstname".to_s, 2)
    response.should have_tag("tr>td", "value for lastname".to_s, 2)
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
  end
end

