class AddDyeRemark < ActiveRecord::Migration
  def self.up
    add_column :dyes, :advance_reduction, :integer
    add_column :dyes, :remarks, :string
  end

  def self.down
    remove_column :dyes, :advance_reduction
    remove_column :dyes, :remarks
  end
end
