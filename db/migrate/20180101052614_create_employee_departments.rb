class CreateEmployeeDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_departments do |t|
      t.integer :employee_id, null: false, index: true
      t.integer :department_id, null: false, index: true

      t.timestamps
    end

    add_index :employee_departments, [:employee_id, :department_id], unique: true
  end
end
