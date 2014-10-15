class CreateWarpBillings < ActiveRecord::Migration
  def self.up
    create_table :warp_billings do |t|
      t.string :type
      t.datetime :date
      t.datetime :requested_date
      t.datetime :received_date
      t.integer :vendor_id
      t.integer :rate
      t.integer :discount
      t.integer :amt_to_warp
      t.string :cancel_order
      t.integer :return_warp
      t.integer :advance
      t.integer :warp_weight
      t.string :description
      t.string :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :warp_billings
  end
end
