class ChangeDateTypeForWorkerAddress < ActiveRecord::Migration
  def self.up
    change_table :workers do |t|
      t.change :address2, :string
    end
  end

  def self.down
    change_table :workers do |t|
    t.change :address2, :integer
    end
  end
end
