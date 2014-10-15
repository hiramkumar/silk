class CreateJariBillings < ActiveRecord::Migration
  def self.up
    create_table :jari_billings do |t|
      t.datetime :date
      t.string :received_qty
      t.string :jari_type
      t.integer :rate
      t.string :discount
      t.integer :advance_amount
      t.integer :amount_to_vendor
      t.string :description
      t.string :batch_no
      t.integer :vendor_id
      t.string :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :jari_billings
  end
end
