class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :item_code
      t.string :description
      t.integer :image_id
      t.integer :warp
      t.integer :silk
      t.integer :warp_cotton
      t.integer :weaving_cotton
      t.string :jari
      t.string :jute
      t.integer :expect_weight

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
