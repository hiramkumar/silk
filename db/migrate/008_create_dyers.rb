class CreateDyers < ActiveRecord::Migration
  def self.up
    create_table :dyers do |t|
      t.integer :worker_id
      t.datetime :date
      t.integer :salary
      t.integer :advance_amount
      t.string  :raw_warp_to_dyer
      t.string  :raw_silk_to_dyer
      t.string  :coloured_warp_from_dyer
      t.string  :coloured_silk_from_dyer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :dyers
  end
end
