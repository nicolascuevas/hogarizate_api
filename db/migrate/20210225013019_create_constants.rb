class CreateConstants < ActiveRecord::Migration[6.1]
  def change
    create_table :constants do |t|
      t.string :name
      t.decimal :value

      t.timestamps
    end
  end
end
