class ChangeDateToStringInLists < ActiveRecord::Migration[5.0]
  def change
    change_column :lists, :date, :string
  end
end
