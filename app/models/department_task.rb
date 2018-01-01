class DepartmentTask < ApplicationRecord
  validates :department, :task, presence: true
  validates :department_id, uniqueness: { scope: :task_id }

  belongs_to :department
  belongs_to :task
end
