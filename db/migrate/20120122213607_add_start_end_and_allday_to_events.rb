class AddStartEndAndAlldayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_at, :datetime
    add_column :events, :end_at, :datetime
    add_column :events, :all_day, :boolean
  end
end
