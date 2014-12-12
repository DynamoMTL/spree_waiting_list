class ChangeWaitingListToSpreeWaitingList < ActiveRecord::Migration
  def self.up
    rename_table :stock_requests, :spree_stock_requests

    add_index :spree_stock_requests, :variant_id
    add_index :spree_stock_requests, :product_id
  end

  def self.down
    remove_index :spree_stock_requests, column: :variant_id
    remove_index :spree_stock_requests, column: :product_id

    rename_table :spree_stock_requests, :stock_requests
  end
end
