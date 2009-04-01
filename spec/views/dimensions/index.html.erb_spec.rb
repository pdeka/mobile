require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dimensions/index.iphone.erb" do
  include DimensionsHelper
  
  before(:each) do
    assigns[:dimensions] = [
      stub_model(Dimension,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Dimension,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of dimensions" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

