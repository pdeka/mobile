require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserRatingsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "user_ratings", :action => "index").should == "/user_ratings"
    end
  
    it "maps #new" do
      route_for(:controller => "user_ratings", :action => "new").should == "/user_ratings/new"
    end
  
    it "maps #show" do
      route_for(:controller => "user_ratings", :action => "show", :id => "1").should == "/user_ratings/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "user_ratings", :action => "edit", :id => "1").should == "/user_ratings/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "user_ratings", :action => "create").should == {:path => "/user_ratings", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "user_ratings", :action => "update", :id => "1").should == {:path =>"/user_ratings/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "user_ratings", :action => "destroy", :id => "1").should == {:path =>"/user_ratings/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/user_ratings").should == {:controller => "user_ratings", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/user_ratings/new").should == {:controller => "user_ratings", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/user_ratings").should == {:controller => "user_ratings", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/user_ratings/1").should == {:controller => "user_ratings", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/user_ratings/1/edit").should == {:controller => "user_ratings", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/user_ratings/1").should == {:controller => "user_ratings", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/user_ratings/1").should == {:controller => "user_ratings", :action => "destroy", :id => "1"}
    end
  end
end
