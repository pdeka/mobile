require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserRatingsController do

  def mock_user_rating(stubs={})
    @mock_user_rating ||= mock_model(UserRating, stubs)
  end
  
  describe "GET index" do

    it "exposes all user_ratings as @user_ratings" do
      UserRating.should_receive(:find).with(:all).and_return([mock_user_rating])
      get :index
      assigns[:user_ratings].should == [mock_user_rating]
    end

    describe "with mime type of xml" do
  
      it "renders all user_ratings as xml" do
        UserRating.should_receive(:find).with(:all).and_return(user_ratings = mock("Array of UserRatings"))
        user_ratings.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested user_rating as @user_rating" do
      UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
      get :show, :id => "37"
      assigns[:user_rating].should equal(mock_user_rating)
    end
    
    describe "with mime type of xml" do

      it "renders the requested user_rating as xml" do
        UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
        mock_user_rating.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new user_rating as @user_rating" do
      UserRating.should_receive(:new).and_return(mock_user_rating)
      get :new
      assigns[:user_rating].should equal(mock_user_rating)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested user_rating as @user_rating" do
      UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
      get :edit, :id => "37"
      assigns[:user_rating].should equal(mock_user_rating)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created user_rating as @user_rating" do
        UserRating.should_receive(:new).with({'these' => 'params'}).and_return(mock_user_rating(:save => true))
        post :create, :user_rating => {:these => 'params'}
        assigns(:user_rating).should equal(mock_user_rating)
      end

      it "redirects to the created user_rating" do
        UserRating.stub!(:new).and_return(mock_user_rating(:save => true))
        post :create, :user_rating => {}
        response.should redirect_to(user_rating_url(mock_user_rating))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved user_rating as @user_rating" do
        UserRating.stub!(:new).with({'these' => 'params'}).and_return(mock_user_rating(:save => false))
        post :create, :user_rating => {:these => 'params'}
        assigns(:user_rating).should equal(mock_user_rating)
      end

      it "re-renders the 'new' template" do
        UserRating.stub!(:new).and_return(mock_user_rating(:save => false))
        post :create, :user_rating => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested user_rating" do
        UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
        mock_user_rating.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_rating => {:these => 'params'}
      end

      it "exposes the requested user_rating as @user_rating" do
        UserRating.stub!(:find).and_return(mock_user_rating(:update_attributes => true))
        put :update, :id => "1"
        assigns(:user_rating).should equal(mock_user_rating)
      end

      it "redirects to the user_rating" do
        UserRating.stub!(:find).and_return(mock_user_rating(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(user_rating_url(mock_user_rating))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested user_rating" do
        UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
        mock_user_rating.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_rating => {:these => 'params'}
      end

      it "exposes the user_rating as @user_rating" do
        UserRating.stub!(:find).and_return(mock_user_rating(:update_attributes => false))
        put :update, :id => "1"
        assigns(:user_rating).should equal(mock_user_rating)
      end

      it "re-renders the 'edit' template" do
        UserRating.stub!(:find).and_return(mock_user_rating(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested user_rating" do
      UserRating.should_receive(:find).with("37").and_return(mock_user_rating)
      mock_user_rating.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the user_ratings list" do
      UserRating.stub!(:find).and_return(mock_user_rating(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(user_ratings_url)
    end

  end

end
