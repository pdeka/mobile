require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomesController do

  def mock_home(stubs={})
    @mock_home ||= mock_model(Home, stubs)
  end
  
  describe "GET index" do

    it "exposes all homes as @homes" do
      Home.should_receive(:find).with(:all).and_return([mock_home])
      get :index
      assigns[:homes].should == [mock_home]
    end

    describe "with mime type of xml" do
  
      it "renders all homes as xml" do
        Home.should_receive(:find).with(:all).and_return(homes = mock("Array of Homes"))
        homes.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested home as @home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      get :show, :id => "37"
      assigns[:home].should equal(mock_home)
    end
    
    describe "with mime type of xml" do

      it "renders the requested home as xml" do
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new home as @home" do
      Home.should_receive(:new).and_return(mock_home)
      get :new
      assigns[:home].should equal(mock_home)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested home as @home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      get :edit, :id => "37"
      assigns[:home].should equal(mock_home)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created home as @home" do
        Home.should_receive(:new).with({'these' => 'params'}).and_return(mock_home(:save => true))
        post :create, :home => {:these => 'params'}
        assigns(:home).should equal(mock_home)
      end

      it "redirects to the created home" do
        Home.stub!(:new).and_return(mock_home(:save => true))
        post :create, :home => {}
        response.should redirect_to(home_url(mock_home))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved home as @home" do
        Home.stub!(:new).with({'these' => 'params'}).and_return(mock_home(:save => false))
        post :create, :home => {:these => 'params'}
        assigns(:home).should equal(mock_home)
      end

      it "re-renders the 'new' template" do
        Home.stub!(:new).and_return(mock_home(:save => false))
        post :create, :home => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested home" do
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :home => {:these => 'params'}
      end

      it "exposes the requested home as @home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => true))
        put :update, :id => "1"
        assigns(:home).should equal(mock_home)
      end

      it "redirects to the home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(home_url(mock_home))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested home" do
        Home.should_receive(:find).with("37").and_return(mock_home)
        mock_home.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :home => {:these => 'params'}
      end

      it "exposes the home as @home" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => false))
        put :update, :id => "1"
        assigns(:home).should equal(mock_home)
      end

      it "re-renders the 'edit' template" do
        Home.stub!(:find).and_return(mock_home(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested home" do
      Home.should_receive(:find).with("37").and_return(mock_home)
      mock_home.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the homes list" do
      Home.stub!(:find).and_return(mock_home(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(homes_url)
    end

  end

end
