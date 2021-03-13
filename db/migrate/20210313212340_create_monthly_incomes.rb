class CreateMonthlyIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_incomes do |t|
      t.references :contact_form, null: false, foreign_key: true
      t.integer :year
      t.integer :month
      t.date :date
      t.integer :total
      t.integer :main
      t.integer :extra

      t.timestamps
    end
  end
end
