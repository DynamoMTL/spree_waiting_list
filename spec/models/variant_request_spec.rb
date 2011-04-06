require File.dirname(__FILE__) + '/../spec_helper'

describe VariantRequest do

  specify { create_variant_request.should be_valid }
  specify { create_variant_request(:email => 'garbage').should have(1).error_on(:email) }
  specify { create_variant_request.status.should == 'new' }

  context "notification" do
  end

  def create_variant_request(fields={})
    VariantRequest.create({:variant_id => 1, :product_id => 1, :email => 'test@home.org'}.merge(fields))
  end
end
