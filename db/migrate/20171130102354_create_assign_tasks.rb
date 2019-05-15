class CreateAssignTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :assign_tasks do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
