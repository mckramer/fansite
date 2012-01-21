class AddFormToMedia < ActiveRecord::Migration
  def change
    add_column :media, :form, :string
  end
end