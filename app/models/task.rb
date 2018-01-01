class Task < ApplicationRecord
  validates :name, :description, :assignee, :assigner, :due_date, presence: true

  belongs_to :assigner,
    primary_key: :id,
    foreign_key: :assigner_id,
    class_name: :Employee

  belongs_to :assignee,
    primary_key: :id,
    foreign_key: :assignee_id,
    class_name: :Employee

  has_many :departments,
    through: :departmentTasks,
    source: :department

  has_many :sub_tasks
end
