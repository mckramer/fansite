class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :teaser
      t.text :description
      t.string :location
      t.string :category

      t.timestamps
    end
  end
end
