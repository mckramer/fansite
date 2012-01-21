class CreateMediaProviders < ActiveRecord::Migration
  def change
    create_table :media_providers do |t|
      t.string :name
      t.string :source_url
      t.string :thumbnail_url
      t.string :content_url
      t.string :homepage_url

      t.timestamps
    end
  end
end
