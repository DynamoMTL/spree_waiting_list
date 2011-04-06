require File.dirname(__FILE__) + '/../spec_helper'

describe WaitingList do

  specify { create_waiting_list.should be_valid }
  specify { create_waiting_list(:email => 'garbage').should have(1).error_on(:email) }
  specify { create_waiting_list.status.should == 'new' }

  def create_waiting_list(fields={})
    WaitingList.create({:variant_id => 1, :product_id => 1, :email => 'test@home.org'}.merge(fields))
  end
end
