require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DimensionsController do

  def mock_dimension(stubs={})
    @mock_dimension ||= mock_model(Dimension, stubs)
  end
  
  describe "GET index" do

    it "exposes all dimensions as @dimensions" do
      Dimension.should_receive(:find).with(:all).and_return([mock_dimension])
      get :index
      assigns[:dimensions].should == [mock_dimension]
    end

    describe "with mime type of xml" do
  
      it "renders all dimensions as xml" do
        Dimension.should_receive(:find).with(:all).and_return(dimensions = mock("Array of Dimensions"))
        dimensions.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested dimension as @dimension" do
      Dimension.should_receive(:find).with("37").and_return(mock_dimension)
      get :show, :id => "37"
      assigns[:dimension].should equal(mock_dimension)
    end
    
    describe "with mime type of xml" do

      it "renders the requested dimension as xml" do
        Dimension.should_receive(:find).with("37").and_return(mock_dimension)
        mock_dimension.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new dimension as @dimension" do
      Dimension.should_receive(:new).and_return(mock_dimension)
      get :new
      assigns[:dimension].should equal(mock_dimension)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested dimension as @dimension" do
      Dimension.should_receive(:find).with("37").and_return(mock_dimension)
      get :edit, :id => "37"
      assigns[:dimension].should equal(mock_dimension)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created dimension as @dimension" do
        Dimension.should_receive(:new).with({'these' => 'params'}).and_return(mock_dimension(:save => true))
        post :create, :dimension => {:these => 'params'}
        assigns(:dimension).should equal(mock_dimension)
      end

      it "redirects to the created dimension" do
        Dimension.stub!(:new).and_return(mock_dimension(:save => true))
        post :create, :dimension => {}
        response.should redirect_to(dimension_url(mock_dimension))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved dimension as @dimension" do
        Dimension.stub!(:new).with({'these' => 'params'}).and_return(mock_dimension(:save => false))
        post :create, :dimension => {:these => 'params'}
        assigns(:dimension).should equal(mock_dimension)
      end

      it "re-renders the 'new' template" do
        Dimension.stub!(:new).and_return(mock_dimension(:save => false))
        post :create, :dimension => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested dimension" do
        Dimension.should_receive(:find).with("37").and_return(mock_dimension)
        mock_dimension.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dimension => {:these => 'params'}
      end

      it "exposes the requested dimension as @dimension" do
        Dimension.stub!(:find).and_return(mock_dimension(:update_attributes => true))
        put :update, :id => "1"
        assigns(:dimension).should equal(mock_dimension)
      end

      it "redirects to the dimension" do
        Dimension.stub!(:find).and_return(mock_dimension(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(dimension_url(mock_dimension))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested dimension" do
        Dimension.should_receive(:find).with("37").and_return(mock_dimension)
        mock_dimension.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dimension => {:these => 'params'}
      end

      it "exposes the dimension as @dimension" do
        Dimension.stub!(:find).and_return(mock_dimension(:update_attributes => false))
        put :update, :id => "1"
        assigns(:dimension).should equal(mock_dimension)
      end

      it "re-renders the 'edit' template" do
        Dimension.stub!(:find).and_return(mock_dimension(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested dimension" do
      Dimension.should_receive(:find).with("37").and_return(mock_dimension)
      mock_dimension.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the dimensions list" do
      Dimension.stub!(:find).and_return(mock_dimension(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(dimensions_url)
    end

  end

end
