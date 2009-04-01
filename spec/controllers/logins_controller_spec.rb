require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LoginsController do

  def mock_login(stubs={})
    @mock_login ||= mock_model(Login, stubs)
  end
  
  describe "GET index" do

    it "exposes all logins as @logins" do
      Login.should_receive(:find).with(:all).and_return([mock_login])
      get :index
      assigns[:logins].should == [mock_login]
    end

    describe "with mime type of xml" do
  
      it "renders all logins as xml" do
        Login.should_receive(:find).with(:all).and_return(logins = mock("Array of Logins"))
        logins.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested login as @login" do
      Login.should_receive(:find).with("37").and_return(mock_login)
      get :show, :id => "37"
      assigns[:login].should equal(mock_login)
    end
    
    describe "with mime type of xml" do

      it "renders the requested login as xml" do
        Login.should_receive(:find).with("37").and_return(mock_login)
        mock_login.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new login as @login" do
      Login.should_receive(:new).and_return(mock_login)
      get :new
      assigns[:login].should equal(mock_login)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested login as @login" do
      Login.should_receive(:find).with("37").and_return(mock_login)
      get :edit, :id => "37"
      assigns[:login].should equal(mock_login)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created login as @login" do
        Login.should_receive(:new).with({'these' => 'params'}).and_return(mock_login(:save => true))
        post :create, :login => {:these => 'params'}
        assigns(:login).should equal(mock_login)
      end

      it "redirects to the created login" do
        Login.stub!(:new).and_return(mock_login(:save => true))
        post :create, :login => {}
        response.should redirect_to(login_url(mock_login))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved login as @login" do
        Login.stub!(:new).with({'these' => 'params'}).and_return(mock_login(:save => false))
        post :create, :login => {:these => 'params'}
        assigns(:login).should equal(mock_login)
      end

      it "re-renders the 'new' template" do
        Login.stub!(:new).and_return(mock_login(:save => false))
        post :create, :login => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested login" do
        Login.should_receive(:find).with("37").and_return(mock_login)
        mock_login.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :login => {:these => 'params'}
      end

      it "exposes the requested login as @login" do
        Login.stub!(:find).and_return(mock_login(:update_attributes => true))
        put :update, :id => "1"
        assigns(:login).should equal(mock_login)
      end

      it "redirects to the login" do
        Login.stub!(:find).and_return(mock_login(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(login_url(mock_login))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested login" do
        Login.should_receive(:find).with("37").and_return(mock_login)
        mock_login.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :login => {:these => 'params'}
      end

      it "exposes the login as @login" do
        Login.stub!(:find).and_return(mock_login(:update_attributes => false))
        put :update, :id => "1"
        assigns(:login).should equal(mock_login)
      end

      it "re-renders the 'edit' template" do
        Login.stub!(:find).and_return(mock_login(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested login" do
      Login.should_receive(:find).with("37").and_return(mock_login)
      mock_login.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the logins list" do
      Login.stub!(:find).and_return(mock_login(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(logins_url)
    end

  end

end
