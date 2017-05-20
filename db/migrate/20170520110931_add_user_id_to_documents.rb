class AddUserIdToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :user_id, :integer
  end
end
