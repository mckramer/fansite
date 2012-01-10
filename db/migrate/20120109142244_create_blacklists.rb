class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists do |t|
      t.string :username

      t.timestamps
      
      t.index :username, :unique => true
    end
  end
end
