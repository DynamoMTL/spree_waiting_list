class RemoveProductFromStockRequest < ActiveRecord::Migration
  def change
    remove_column :spree_stock_requests, :product_id
  end
end
