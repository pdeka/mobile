require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/new.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:home] = stub_model(Home,
      :new_record? => true
    )
  end

  it "renders new home form" do
    render
    
    response.should have_tag("form[action=?][method=post]", homes_path) do
    end
  end
end


