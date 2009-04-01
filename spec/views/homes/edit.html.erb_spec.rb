require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/homes/edit.html.erb" do
  include HomesHelper
  
  before(:each) do
    assigns[:home] = @home = stub_model(Home,
      :new_record? => false
    )
  end

  it "renders the edit home form" do
    render
    
    response.should have_tag("form[action=#{home_path(@home)}][method=post]") do
    end
  end
end


