class AddLocaleAndTimeZoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string
    add_column :users, :time_zone, :string
  end
end
