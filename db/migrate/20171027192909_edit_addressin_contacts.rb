class EditAddressinContacts < ActiveRecord::Migration[5.0]
  def change
    rename_column :contacts, :address, :street
  end
end
