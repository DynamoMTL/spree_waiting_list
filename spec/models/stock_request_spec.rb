require File.dirname(__FILE__) + '/../spec_helper'

describe StockRequest do

  specify { create_stock_request.should be_valid }
  specify { create_stock_request(:email => 'garbage').should have(1).error_on(:email) }
  specify { create_stock_request.status.should == 'new' }

  context "notification" do
    before do
      mail = mock(:mail)
      @request = create_stock_request
      UserMailer.should_receive(:back_in_stock).with(@request).and_return(mail)
      mail.should_receive(:deliver)
      @request.notify! 
    end

    specify { @request.status.should == 'notified' }
    specify { StockRequest.notified(false).should have(0).stock_requests }
    specify { StockRequest.notified(true).should  have(1).stock_requests }
  end

  def create_stock_request(fields={})
    StockRequest.create({:variant_id => 1, :product_id => 1, :email => 'test@home.org'}.merge(fields))
  end
end
