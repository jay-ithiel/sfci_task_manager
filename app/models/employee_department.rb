class EmployeeDepartment < ApplicationRecord
  validates :employee, :department, presence: true
  validates :employee_id, uniqueness: { scope: :department_id }

  belongs_to :employee
  belongs_to :department
end
