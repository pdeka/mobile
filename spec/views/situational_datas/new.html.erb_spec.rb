require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/situational_datas/new.html.erb" do
  include SituationalDatasHelper
  
  before(:each) do
    assigns[:situational_data] = stub_model(SituationalData,
      :new_record? => true,
      :location => "value for location",
      :accompanying_people => "value for accompanying_people",
      :significant_occurences => "value for significant_occurences"
    )
  end

  it "renders new situational_data form" do
    render
    
    response.should have_tag("form[action=?][method=post]", situational_datas_path) do
      with_tag("input#situational_data_location[name=?]", "situational_data[location]")
      with_tag("textarea#situational_data_accompanying_people[name=?]", "situational_data[accompanying_people]")
      with_tag("textarea#situational_data_significant_occurences[name=?]", "situational_data[significant_occurences]")
    end
  end
end


