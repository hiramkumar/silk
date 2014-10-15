class DyesDataTypeChange < ActiveRecord::Migration
  def self.up
    change_table :dyes do |t|
      t.change :raw_warp_to_dyer, :text
      t.change :raw_silk_to_dyer, :text
    end
  end

  def self.down
    change_table :dyes do |t|
      t.string :raw_warp_to_dyer
      t.string :raw_silk_to_dyer
      end
  end
end
