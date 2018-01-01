class CreateSubTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :task_id, null: false
      t.integer :assignee_id, null: false
      t.integer :assigner_id, null: false
      t.datetime :due_date, null: false
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
