class AddDateToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :date, :date
  end
end
