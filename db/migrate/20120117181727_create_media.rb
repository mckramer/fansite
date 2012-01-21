class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :provider
      t.string :direct_url
      t.string :content_url
      t.text :captions
      t.text :analysis
      t.date :recorded_on
      t.date :released_on

      t.timestamps
    end
  end
end
