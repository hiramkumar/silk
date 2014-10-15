class CreateDesigners < ActiveRecord::Migration
  def self.up
    create_table :designers do |t|
      t.datetime :date
      t.integer :vendor_id
      t.string :design_id
      t.integer :rate
      t.integer :discount
      t.integer :amt_to_vendor
      t.integer :advance
      t.string :description
      t.datetime :due_date

      t.timestamps
    end
  end

  def self.down
    drop_table :designers
  end
end
