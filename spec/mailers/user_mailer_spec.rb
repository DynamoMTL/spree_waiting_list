require 'spec_helper'

describe UserMailer do
  context "back in stock" do
    let(:request) { mock_model(VariantRequest, 
                               :email => 'test@123.com',
                               :variant => nil, 
                               :product => mock_model(Product, :name => 'Widget')) }
    before do 
      Spree::Config.set :order_from => 'admin@mysite.com'
      @mail = UserMailer.back_in_stock(request)
    end

    specify { @mail.subject.should == "Hey! Widget is back in stock" }
    specify { @mail.to.should      include("test@123.com") }
    specify { @mail.from.should    include("admin@mysite.com") }
    
  end
end
