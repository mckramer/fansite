class AddLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location_id, :integer
    add_index :events, :location_id
  end
end
