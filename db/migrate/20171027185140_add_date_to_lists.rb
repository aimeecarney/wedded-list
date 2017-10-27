class AddDateToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :date, :integer
    add_column :lists, :street, :string
    add_column :lists, :city, :string
    add_column :lists, :state, :string
  end
end
