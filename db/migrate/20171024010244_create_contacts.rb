class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :plus_one_name

      t.timestamps
    end
  end
end
