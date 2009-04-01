require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dimensions/edit.html.erb" do
  include DimensionsHelper
  
  before(:each) do
    assigns[:dimension] = @dimension = stub_model(Dimension,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit dimension form" do
    render
    
    response.should have_tag("form[action=#{dimension_path(@dimension)}][method=post]") do
      with_tag('input#dimension_name[name=?]', "dimension[name]")
      with_tag('input#dimension_description[name=?]', "dimension[description]")
    end
  end
end


