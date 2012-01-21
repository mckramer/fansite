class AddMediaProviderIdToMedium < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.integer :media_provider_id
    end
  end
end
