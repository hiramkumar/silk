class CreateLooms < ActiveRecord::Migration
  def self.up
    create_table :looms do |t|
      t.integer :worker_id
      t.datetime :entry_date
      t.integer :salary_amount
      t.integer :advance_amount
      t.string :warp_to_weaver
      t.string :silk_to_weaver
      t.string :jari_to_weaver
      t.string :jute_to_weaver
      t.string :weaving_cotton
      t.string :warp_cotton
      t.string :sarees_from_weaver

      t.timestamps
    end
  end

  def self.down
    drop_table :looms
  end
end
