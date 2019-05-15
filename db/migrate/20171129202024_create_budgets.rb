class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.date :allocateddate
      t.decimal :total
      t.decimal :spent
      t.decimal :balance
      t.text :note

      t.timestamps
    end
  end
end
