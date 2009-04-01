require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DimensionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "dimensions", :action => "index").should == "/dimensions"
    end
  
    it "maps #new" do
      route_for(:controller => "dimensions", :action => "new").should == "/dimensions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "dimensions", :action => "show", :id => "1").should == "/dimensions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "dimensions", :action => "edit", :id => "1").should == "/dimensions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "dimensions", :action => "create").should == {:path => "/dimensions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "dimensions", :action => "update", :id => "1").should == {:path =>"/dimensions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "dimensions", :action => "destroy", :id => "1").should == {:path =>"/dimensions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/dimensions").should == {:controller => "dimensions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/dimensions/new").should == {:controller => "dimensions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/dimensions").should == {:controller => "dimensions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/dimensions/1").should == {:controller => "dimensions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/dimensions/1/edit").should == {:controller => "dimensions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/dimensions/1").should == {:controller => "dimensions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/dimensions/1").should == {:controller => "dimensions", :action => "destroy", :id => "1"}
    end
  end
end
