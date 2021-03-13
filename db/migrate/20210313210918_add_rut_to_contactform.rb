class AddRutToContactform < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_forms, :rut, :string
    add_column :contact_forms, :last_digits, :string
  end
end
