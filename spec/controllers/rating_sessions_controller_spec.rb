require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RatingSessionsController do

  def mock_rating_session(stubs={})
    @mock_rating_session ||= mock_model(RatingSession, stubs)
  end
  
  describe "GET index" do

    it "exposes all rating_sessions as @rating_sessions" do
      RatingSession.should_receive(:find).with(:all).and_return([mock_rating_session])
      get :index
      assigns[:rating_sessions].should == [mock_rating_session]
    end

    describe "with mime type of xml" do
  
      it "renders all rating_sessions as xml" do
        RatingSession.should_receive(:find).with(:all).and_return(rating_sessions = mock("Array of RatingSessions"))
        rating_sessions.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested rating_session as @rating_session" do
      RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
      get :show, :id => "37"
      assigns[:rating_session].should equal(mock_rating_session)
    end
    
    describe "with mime type of xml" do

      it "renders the requested rating_session as xml" do
        RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
        mock_rating_session.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new rating_session as @rating_session" do
      RatingSession.should_receive(:new).and_return(mock_rating_session)
      get :new
      assigns[:rating_session].should equal(mock_rating_session)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested rating_session as @rating_session" do
      RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
      get :edit, :id => "37"
      assigns[:rating_session].should equal(mock_rating_session)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created rating_session as @rating_session" do
        RatingSession.should_receive(:new).with({'these' => 'params'}).and_return(mock_rating_session(:save => true))
        post :create, :rating_session => {:these => 'params'}
        assigns(:rating_session).should equal(mock_rating_session)
      end

      it "redirects to the created rating_session" do
        RatingSession.stub!(:new).and_return(mock_rating_session(:save => true))
        post :create, :rating_session => {}
        response.should redirect_to(rating_session_url(mock_rating_session))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved rating_session as @rating_session" do
        RatingSession.stub!(:new).with({'these' => 'params'}).and_return(mock_rating_session(:save => false))
        post :create, :rating_session => {:these => 'params'}
        assigns(:rating_session).should equal(mock_rating_session)
      end

      it "re-renders the 'new' template" do
        RatingSession.stub!(:new).and_return(mock_rating_session(:save => false))
        post :create, :rating_session => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested rating_session" do
        RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
        mock_rating_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rating_session => {:these => 'params'}
      end

      it "exposes the requested rating_session as @rating_session" do
        RatingSession.stub!(:find).and_return(mock_rating_session(:update_attributes => true))
        put :update, :id => "1"
        assigns(:rating_session).should equal(mock_rating_session)
      end

      it "redirects to the rating_session" do
        RatingSession.stub!(:find).and_return(mock_rating_session(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(rating_session_url(mock_rating_session))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested rating_session" do
        RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
        mock_rating_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rating_session => {:these => 'params'}
      end

      it "exposes the rating_session as @rating_session" do
        RatingSession.stub!(:find).and_return(mock_rating_session(:update_attributes => false))
        put :update, :id => "1"
        assigns(:rating_session).should equal(mock_rating_session)
      end

      it "re-renders the 'edit' template" do
        RatingSession.stub!(:find).and_return(mock_rating_session(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested rating_session" do
      RatingSession.should_receive(:find).with("37").and_return(mock_rating_session)
      mock_rating_session.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the rating_sessions list" do
      RatingSession.stub!(:find).and_return(mock_rating_session(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(rating_sessions_url)
    end

  end

end
