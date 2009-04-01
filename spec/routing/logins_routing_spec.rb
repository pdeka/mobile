require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LoginsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "logins", :action => "index").should == "/logins"
    end
  
    it "maps #new" do
      route_for(:controller => "logins", :action => "new").should == "/logins/new"
    end
  
    it "maps #show" do
      route_for(:controller => "logins", :action => "show", :id => "1").should == "/logins/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "logins", :action => "edit", :id => "1").should == "/logins/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "logins", :action => "create").should == {:path => "/logins", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "logins", :action => "update", :id => "1").should == {:path =>"/logins/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "logins", :action => "destroy", :id => "1").should == {:path =>"/logins/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/logins").should == {:controller => "logins", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/logins/new").should == {:controller => "logins", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/logins").should == {:controller => "logins", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/logins/1").should == {:controller => "logins", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/logins/1/edit").should == {:controller => "logins", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/logins/1").should == {:controller => "logins", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/logins/1").should == {:controller => "logins", :action => "destroy", :id => "1"}
    end
  end
end
