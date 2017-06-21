class RenameDocumentsToNotes < ActiveRecord::Migration[5.0]
  def up
    rename_table :documents, :notes
  end

  def down
    rename_table :notes, :documents
  end
end
