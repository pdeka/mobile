require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.iphone.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders new user form" do
    render
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_firstname[name=?]", "user[firstname]")
      with_tag("input#user_lastname[name=?]", "user[lastname]")
      with_tag("input#user_username[name=?]", "user[username]")
      with_tag("input#user_password[name=?]", "user[password]")
    end
  end
end


