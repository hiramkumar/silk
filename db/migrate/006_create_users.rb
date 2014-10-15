class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
@us = User.new(:name => "Ram",:password => "Ram")
@us.save
  end

  def self.down
    drop_table :users
  end
end
