class AddClmnloom < ActiveRecord::Migration
  def self.up
    add_column :looms, :warp_length, :integer
  end

  def self.down
    remove_column :looms, :warp_length
  end
end
