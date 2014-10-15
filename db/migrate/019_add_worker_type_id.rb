class AddWorkerTypeId < ActiveRecord::Migration
  def self.up
      add_column :workers, :worker_type_id, :integer
  end

  def self.down
    remove_column :workers, :worker_type_id
  end
end
