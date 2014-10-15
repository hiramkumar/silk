class CreateVendorTypes < ActiveRecord::Migration
  def self.up
    create_table :vendor_types do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :vendor_types
  end
end
