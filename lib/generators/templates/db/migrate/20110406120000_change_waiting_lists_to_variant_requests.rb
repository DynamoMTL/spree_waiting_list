class ChangeWaitingListsToVariantRequests < ActiveRecord::Migration
  def self.up
    rename_table :waiting_lists, :variant_requests
  end

  def self.down
    rename_table :variant_requests, :waiting_lists
  end
end
