require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dimensions/new.html.erb" do
  include DimensionsHelper
  
  before(:each) do
    assigns[:dimension] = stub_model(Dimension,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new dimension form" do
    render
    
    response.should have_tag("form[action=?][method=post]", dimensions_path) do
      with_tag("input#dimension_name[name=?]", "dimension[name]")
      with_tag("input#dimension_description[name=?]", "dimension[description]")
    end
  end
end


