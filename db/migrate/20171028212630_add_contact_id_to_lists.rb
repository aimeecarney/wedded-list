class AddContactIdToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :contact_id, :integer
  end
end
