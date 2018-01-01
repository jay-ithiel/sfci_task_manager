class EmployeeDepartment < ApplicationRecord
  validates :employee, :department, presence: true
  
  belongs_to :employee
  belongs_to :department
end
