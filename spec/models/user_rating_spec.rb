require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserRating do
  before(:each) do
    @valid_attributes = {
      :rating => 1,
      :situational_data => "value for situational_data",
      :reference_number => 1,
      :channel => "value for channel"
    }
  end

  it "should create a new instance given valid attributes" do
    UserRating.create!(@valid_attributes)
  end
end
