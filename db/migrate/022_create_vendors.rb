class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name
      t.string :status
      t.integer :vendor_type_id
      t.string :address
      t.string :phone_no
      t.string :person_name
      t.string :email_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
