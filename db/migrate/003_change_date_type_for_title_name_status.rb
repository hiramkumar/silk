class ChangeDateTypeForTitleNameStatus < ActiveRecord::Migration
  def self.up
    change_table :titles do |t|
      t.change :name, :string
      t.change :status, :string
    end
  end

  def self.down
    change_table :titles do |t|
    t.string :name
    t.string :status
    end
  end
end
