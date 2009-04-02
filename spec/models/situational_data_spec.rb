require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SituationalData do
  before(:each) do
    @valid_attributes = {
      :location => "value for location",
      :accompanying_people => "value for accompanying_people",
      :significant_occurences => "value for significant_occurences"
    }
  end

  it "should create a new instance given valid attributes" do
    SituationalData.create!(@valid_attributes)
  end
end
