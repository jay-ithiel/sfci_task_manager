class CreateDepartmentSubTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :department_sub_tasks do |t|
      t.integer :department_id, null: false, index: true
      t.integer :sub_task_id, null: false, index: true

      t.timestamps
    end

    add_index :department_sub_tasks, [:department_id, :sub_task_id], unique: true
  end
end
