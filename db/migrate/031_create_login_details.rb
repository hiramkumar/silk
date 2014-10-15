class CreateLoginDetails < ActiveRecord::Migration
  def self.up
    create_table :login_details do |t|
      t.integer :user
      t.datetime :login
      t.datetime :logout

      t.timestamps
    end
  end

  def self.down
    drop_table :login_details
  end
end
