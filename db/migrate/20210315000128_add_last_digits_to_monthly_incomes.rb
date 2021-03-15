class AddLastDigitsToMonthlyIncomes < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_incomes, :last_digits, :string
  end
end
