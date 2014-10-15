class CreateJuteBillings < ActiveRecord::Migration
  def self.up
    create_table :jute_billings do |t|
      t.datetime :date
      t.string :type
      t.integer :received_qty
      t.integer :vendor_id
      t.string :description
      t.integer :rate
      t.integer :discount
      t.integer :adv_amt
      t.integer :amt_to_vendor
      t.integer :return_qty
      t.string :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :jute_billings
  end
end
