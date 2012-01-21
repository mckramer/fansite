class AddDobAsDateToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.date :dob
    end
  end
end
