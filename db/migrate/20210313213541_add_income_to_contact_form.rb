class AddIncomeToContactForm < ActiveRecord::Migration[6.1]
  def change
    add_column :contact_forms, :average_income, :integer
  end
end
