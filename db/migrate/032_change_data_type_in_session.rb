class ChangeDataTypeInSession < ActiveRecord::Migration
  def self.up
    change_table :sessions do |t|
      t.change :session_id, :text
    end
  end

  def self.down
    change_table :sessions do |t|
      t.string :session_id
  end
  end
end
