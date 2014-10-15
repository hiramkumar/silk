class CreateClientBillings < ActiveRecord::Migration
  def self.up
    create_table :client_billings do |t|
      t.integer :client_id
      t.string :order_type
      t.string :no_of_sarees
      t.string :cost_price
      t.string :discount
      t.string :rcd_amount
      t.string :advance
      t.string :balance_amt
      t.date :date
      t.string :description
      t.string :returned_sarees
      t.string :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :client_billings
  end
end
