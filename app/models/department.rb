class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :employees,
    through: :employeeDepartments,
    source: :employee

  has_many :tasks,
    through: :departmentTasks,
    source: :task

  has_many :sub_tasks,
    through: :departmentSubTasks,
    source: :sub_task
end
