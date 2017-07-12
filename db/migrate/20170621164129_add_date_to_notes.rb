class AddDateToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :date, :date
    Note.update_all('date = created_at')
  end
end
