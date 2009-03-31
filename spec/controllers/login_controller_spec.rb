require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LoginController do

  #Delete these examples and add some real ones
  it "should use LoginController" do
    controller.should be_an_instance_of(LoginController)
  end


  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end
end
