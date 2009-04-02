require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SituationalDatasController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "situational_datas", :action => "index").should == "/situational_datas"
    end
  
    it "maps #new" do
      route_for(:controller => "situational_datas", :action => "new").should == "/situational_datas/new"
    end
  
    it "maps #show" do
      route_for(:controller => "situational_datas", :action => "show", :id => "1").should == "/situational_datas/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "situational_datas", :action => "edit", :id => "1").should == "/situational_datas/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "situational_datas", :action => "create").should == {:path => "/situational_datas", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "situational_datas", :action => "update", :id => "1").should == {:path =>"/situational_datas/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "situational_datas", :action => "destroy", :id => "1").should == {:path =>"/situational_datas/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/situational_datas").should == {:controller => "situational_datas", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/situational_datas/new").should == {:controller => "situational_datas", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/situational_datas").should == {:controller => "situational_datas", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/situational_datas/1").should == {:controller => "situational_datas", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/situational_datas/1/edit").should == {:controller => "situational_datas", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/situational_datas/1").should == {:controller => "situational_datas", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/situational_datas/1").should == {:controller => "situational_datas", :action => "destroy", :id => "1"}
    end
  end
end
