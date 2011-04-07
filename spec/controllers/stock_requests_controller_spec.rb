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
  end
end
