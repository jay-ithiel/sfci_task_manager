class DepartmentSubTask < ApplicationRecord
  validates :department, :sub_task, presence: true
  validates :department_id, uniqueness: { scope: :sub_task_id }

  belongs_to :department
  belongs_to :sub_task
end
