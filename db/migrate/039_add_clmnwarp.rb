class AddClmnwarp < ActiveRecord::Migration
  def self.up
   add_column :warp_billings, :warp_length, :integer
  end

  def self.down
    remove_column :warp_billings, :warp_length
  end
end
