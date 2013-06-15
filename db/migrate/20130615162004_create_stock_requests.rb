class CreateStockRequests < ActiveRecord::Migration
  def self.up
    create_table :spree_stock_requests do |t|
      t.string :email
      t.integer :product_id
      t.integer :variant_id
      t.string :status, :default => 'new' 

      t.timestamps
    end
  end

  def self.down
    drop_table :spree_stock_requests
  end
end
