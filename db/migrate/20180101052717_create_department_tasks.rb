class CreateDepartmentTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :department_tasks do |t|
      t.integer :department_id, null: false, index: true
      t.integer :task_id, null: false, index: true

      t.timestamps
    end

    add_index :department_tasks, [:department_id, :task_id], unique: true
  end
end
