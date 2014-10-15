class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.integer :title_id
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :address1
      t.integer :address2
      t.string :referred_by
      t.string :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
