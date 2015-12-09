class AddNotesAndModelNumberToItems < ActiveRecord::Migration
  def change
    add_column :items, :notes, :text
    add_column :items, :model_number, :string
  end
end
