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
      let(:request) { mock_model(StockRequest, :save => true) }

      before do
        StockRequest.should_receive(:new).with(:data).and_return(request)
      end

      context "html format" do
        before { post :create, :stock_request => :data }

        specify { response.should redirect_to(root_path) }
        specify { flash[:notice].should == I18n.t(:successful_stock_request) }
      end

      context "js format" do
        before { xhr :post, :create, :stock_request => :data }

        specify { response.should be_success }
        specify { response.should render_template('create') }
      end

      context "logged in" do
        let(:user) { create_user }

        it "should set email" do
          request.should_receive(:email=).with(user.email)
          sign_in user
          post :create, :stock_request => :data
        end
      end
    end


    context "invalid data" do
      let(:request) { mock_model(StockRequest, :save => false) }

      before do
        StockRequest.should_receive(:new).with(:data).and_return(request)
        post :create, :stock_request => :data
      end
  
      specify { assigns(:stock_request).should == request }
      specify { response.should be_success }
      specify { response.should render_template('new') }
    end
  end
end
