class CreateUserMails < ActiveRecord::Migration
  def self.up
    create_table :user_mails do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end

  def self.down
    drop_table :user_mails
  end
end
