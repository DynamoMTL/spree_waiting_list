class CreateWaitingLists < ActiveRecord::Migration
  def self.up
    create_table :waiting_lists do |t|
      t.string :email
      t.integer :product_id
      t.integer :variant_id
      t.string :status, :default => 'new' 

      t.timestamps
    end
  end

  def self.down
    drop_table :waiting_lists
  end
end
