class ChangeContactFormtoNullInMonthlyIncome < ActiveRecord::Migration[6.1]
  def change
  	change_column :monthly_incomes, :contact_form_id, :integer, :null => true
  end
end
