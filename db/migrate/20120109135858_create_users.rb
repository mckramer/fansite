class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :dob
      t.string :name
      t.string :username
      t.string :gender

      t.timestamps
      
      t.index :email, :unique => true
      t.index :username, :unique => true
    end
  end
end
