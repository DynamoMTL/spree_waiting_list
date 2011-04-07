require 'spec_helper'

describe StockRequestsController do
  context "GET /new" do
    before do 
      StockRequest.should_receive(:new).and_return(:request)
      get :new
    end

    specify { assigns(:stock_request).should == :request }
    specify { response.should be_success }
  end

  context "POST /create" do
    context "valid data" do
      let(:request) { mock_model(StockRequest, :valid? => true) }

      before do
        StockRequest.should_receive(:create).with(:data).and_return(request)
        post :create, :stock_request => :data
      end

      specify { response.should redirect_to(root_path) }
      specify { flash[:notice].should == I18n.t(:successful_stock_request) }
    end

    context "invalid data" do
      let(:request) { mock_model(StockRequest, :valid? => false) }

      before do
        StockRequest.should_receive(:create).with(:data).and_return(request)
        post :create, :stock_request => :data
      end
  
      specify { assigns(:stock_request).should == request }
      specify { response.should be_success }
      specify { response.should render_template('new') }
    end
  end
end
