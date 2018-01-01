class DepartmentTask < ApplicationRecord
  validates :department_id, :task_id, presence: true
  
  belongs_to :department
  belongs_to :task
end
