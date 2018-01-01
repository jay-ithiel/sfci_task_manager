class EmployeeDepartment < ApplicationRecord
  validates :assigner, :assignee, presence: true
end
