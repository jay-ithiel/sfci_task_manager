class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :employees,
    through: :employeeDepartments,
    source: :employee

  has_many :tasks,
    through: :departmentTasks,
    source: :task
end
