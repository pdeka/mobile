require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/logins/edit.html.erb" do
  include LoginsHelper
  
  before(:each) do
    assigns[:login] = @login = stub_model(Login,
      :new_record? => false
    )
  end

  it "renders the edit login form" do
    render
    
    response.should have_tag("form[action=#{login_path(@login)}][method=post]") do
    end
  end
end


