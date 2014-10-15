class AddClmnDye < ActiveRecord::Migration
  def self.up
    add_column :dyes, :warp_length, :integer
  end

  def self.down
    remove_column :dyes, :warp_length
  end
end
