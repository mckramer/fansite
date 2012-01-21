class ChangeMediumWithUrls < ActiveRecord::Migration
  def change
    remove_column :media, :provider
    remove_column :media, :direct_url
    change_table :media do |t|
      t.string :source_url
      t.string :thumbnail_url
    end
  end
end
