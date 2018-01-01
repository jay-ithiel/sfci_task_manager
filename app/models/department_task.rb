class DepartmentTask < ApplicationRecord
  validates :department_id, :task_id, presence: true
end
