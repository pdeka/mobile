require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RatingSession do
  before(:each) do
    @valid_attributes = {
      :reference_number => 1,
      :channel => "value for channel"
    }
  end

  it "should create a new instance given valid attributes" do
    RatingSession.create!(@valid_attributes)
  end
end
