require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/situational_datas/show.html.erb" do
  include SituationalDatasHelper
  before(:each) do
    assigns[:situational_data] = @situational_data = stub_model(SituationalData,
      :location => "value for location",
      :accompanying_people => "value for accompanying_people",
      :significant_occurences => "value for significant_occurences"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ location/)
    response.should have_text(/value\ for\ accompanying_people/)
    response.should have_text(/value\ for\ significant_occurences/)
  end
end

