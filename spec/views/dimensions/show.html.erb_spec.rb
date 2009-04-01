require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dimensions/show.html.erb" do
  include DimensionsHelper
  before(:each) do
    assigns[:dimension] = @dimension = stub_model(Dimension,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end

