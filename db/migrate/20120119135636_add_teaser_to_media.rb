class AddTeaserToMedia < ActiveRecord::Migration
  def change
    add_column :media, :teaser, :string
  end
end
