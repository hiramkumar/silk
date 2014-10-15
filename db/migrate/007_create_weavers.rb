class CreateWeavers < ActiveRecord::Migration
  def self.up
    create_table :weavers do |t|
      t.integer :worker_id
      t.datetime :date
      t.integer :salary
      t.integer :advance_amount
      t.string  :warp
      t.string  :silk
      t.string  :jari
      t.string  :jute
      t.string  :weaving_cotton
      t.string  :warp_cotton
      t.string  :saree
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :weavers
  end
end
