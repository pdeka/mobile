require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/edit.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :username => "value for username",
      :password => "value for password"
    )
  end

  it "renders the edit user form" do
    render
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_firstname[name=?]', "user[firstname]")
      with_tag('input#user_lastname[name=?]', "user[lastname]")
      with_tag('input#user_username[name=?]', "user[username]")
      with_tag('input#user_password[name=?]', "user[password]")
    end
  end
end


