class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :updates, :user_id
  end
end
