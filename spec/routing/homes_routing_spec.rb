require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "homes", :action => "index").should == "/homes"
    end
  
    it "maps #new" do
      route_for(:controller => "homes", :action => "new").should == "/homes/new"
    end
  
    it "maps #show" do
      route_for(:controller => "homes", :action => "show", :id => "1").should == "/homes/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "homes", :action => "edit", :id => "1").should == "/homes/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "homes", :action => "create").should == {:path => "/homes", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "homes", :action => "update", :id => "1").should == {:path =>"/homes/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "homes", :action => "destroy", :id => "1").should == {:path =>"/homes/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/homes").should == {:controller => "homes", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/homes/new").should == {:controller => "homes", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/homes").should == {:controller => "homes", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/homes/1").should == {:controller => "homes", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/homes/1/edit").should == {:controller => "homes", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/homes/1").should == {:controller => "homes", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/homes/1").should == {:controller => "homes", :action => "destroy", :id => "1"}
    end
  end
end
