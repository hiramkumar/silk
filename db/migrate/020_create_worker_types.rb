class CreateWorkerTypes < ActiveRecord::Migration
  def self.up
    create_table :worker_types do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :worker_types
  end
end
