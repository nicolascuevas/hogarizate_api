class AddCaseIdToContactForm < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_forms, :case_id, :string
  end
end
