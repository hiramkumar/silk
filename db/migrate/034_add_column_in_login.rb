class AddColumnInLogin < ActiveRecord::Migration
  def self.up
    add_column :login_details, :login_time, :time
    add_column :login_details, :logout_time, :time
  end

  def self.down
    remove_column :login_details, :login_time
    remove_column :login_details, :logout_time
  end
end
