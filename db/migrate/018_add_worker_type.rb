class AddWorkerType < ActiveRecord::Migration
  def self.up
    add_column :workers, :worker_type, :string
  end

  def self.down
    remove_column :workers, :worker_type
  end
end
