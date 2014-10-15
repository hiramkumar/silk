class CreateSilkBillings < ActiveRecord::Migration
  def self.up
    create_table :silk_billings do |t|
      t.datetime :date
      t.string :type
      t.integer :received_silk
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
    drop_table :silk_billings
  end
end
