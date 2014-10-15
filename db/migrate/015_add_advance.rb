class AddAdvance < ActiveRecord::Migration
  def self.up
    add_column :looms, :advance_reduction, :integer
    add_column :looms, :saree_weight, :integer
  end

  def self.down
    remove_column :looms, :advance_reduction
    remove_column :looms, :saree_weight
  end
end
