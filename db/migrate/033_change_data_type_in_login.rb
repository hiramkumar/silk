class ChangeDataTypeInLogin < ActiveRecord::Migration
  def self.up
    change_table :login_details do |t|
      t.change :login, :date
      t.change :logout, :date
    end
  end

  def self.down
      change_table :login_details do |t|
      t.datetime :login
      t.datetime :logout
      end
  end
end
