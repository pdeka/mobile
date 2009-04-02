require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SituationalDatasController do

  def mock_situational_data(stubs={})
    @mock_situational_data ||= mock_model(SituationalData, stubs)
  end
  
  describe "GET index" do

    it "exposes all situational_datas as @situational_datas" do
      SituationalData.should_receive(:find).with(:all).and_return([mock_situational_data])
      get :index
      assigns[:situational_datas].should == [mock_situational_data]
    end

    describe "with mime type of xml" do
  
      it "renders all situational_datas as xml" do
        SituationalData.should_receive(:find).with(:all).and_return(situational_datas = mock("Array of SituationalDatas"))
        situational_datas.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested situational_data as @situational_data" do
      SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
      get :show, :id => "37"
      assigns[:situational_data].should equal(mock_situational_data)
    end
    
    describe "with mime type of xml" do

      it "renders the requested situational_data as xml" do
        SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
        mock_situational_data.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new situational_data as @situational_data" do
      SituationalData.should_receive(:new).and_return(mock_situational_data)
      get :new
      assigns[:situational_data].should equal(mock_situational_data)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested situational_data as @situational_data" do
      SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
      get :edit, :id => "37"
      assigns[:situational_data].should equal(mock_situational_data)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created situational_data as @situational_data" do
        SituationalData.should_receive(:new).with({'these' => 'params'}).and_return(mock_situational_data(:save => true))
        post :create, :situational_data => {:these => 'params'}
        assigns(:situational_data).should equal(mock_situational_data)
      end

      it "redirects to the created situational_data" do
        SituationalData.stub!(:new).and_return(mock_situational_data(:save => true))
        post :create, :situational_data => {}
        response.should redirect_to(situational_data_url(mock_situational_data))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved situational_data as @situational_data" do
        SituationalData.stub!(:new).with({'these' => 'params'}).and_return(mock_situational_data(:save => false))
        post :create, :situational_data => {:these => 'params'}
        assigns(:situational_data).should equal(mock_situational_data)
      end

      it "re-renders the 'new' template" do
        SituationalData.stub!(:new).and_return(mock_situational_data(:save => false))
        post :create, :situational_data => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested situational_data" do
        SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
        mock_situational_data.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :situational_data => {:these => 'params'}
      end

      it "exposes the requested situational_data as @situational_data" do
        SituationalData.stub!(:find).and_return(mock_situational_data(:update_attributes => true))
        put :update, :id => "1"
        assigns(:situational_data).should equal(mock_situational_data)
      end

      it "redirects to the situational_data" do
        SituationalData.stub!(:find).and_return(mock_situational_data(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(situational_data_url(mock_situational_data))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested situational_data" do
        SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
        mock_situational_data.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :situational_data => {:these => 'params'}
      end

      it "exposes the situational_data as @situational_data" do
        SituationalData.stub!(:find).and_return(mock_situational_data(:update_attributes => false))
        put :update, :id => "1"
        assigns(:situational_data).should equal(mock_situational_data)
      end

      it "re-renders the 'edit' template" do
        SituationalData.stub!(:find).and_return(mock_situational_data(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested situational_data" do
      SituationalData.should_receive(:find).with("37").and_return(mock_situational_data)
      mock_situational_data.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the situational_datas list" do
      SituationalData.stub!(:find).and_return(mock_situational_data(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(situational_datas_url)
    end

  end

end
