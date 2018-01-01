class CreateEmployeeDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_departments do |t|
      t.integer :employee_id, null: false
      t.integer :department_id, null: false

      t.timestamps
    end
  end
end
