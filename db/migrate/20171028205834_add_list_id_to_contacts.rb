class AddListIdToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :list_id, :integer
  end
end
