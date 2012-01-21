class AddProviderMediaIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :provider_media_id, :string
  end
end
