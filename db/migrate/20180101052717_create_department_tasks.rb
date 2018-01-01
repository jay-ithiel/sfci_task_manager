class CreateDepartmentTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :department_tasks do |t|
      t.integer :department_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
