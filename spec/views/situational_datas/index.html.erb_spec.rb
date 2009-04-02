require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/situational_datas/index.iphone.erb" do
  include SituationalDatasHelper
  
  before(:each) do
    assigns[:situational_datas] = [
      stub_model(SituationalData,
        :location => "value for location",
        :accompanying_people => "value for accompanying_people",
        :significant_occurences => "value for significant_occurences"
      ),
      stub_model(SituationalData,
        :location => "value for location",
        :accompanying_people => "value for accompanying_people",
        :significant_occurences => "value for significant_occurences"
      )
    ]
  end

  it "renders a list of situational_datas" do
    render
    response.should have_tag("tr>td", "value for location".to_s, 2)
    response.should have_tag("tr>td", "value for accompanying_people".to_s, 2)
    response.should have_tag("tr>td", "value for significant_occurences".to_s, 2)
  end
end

