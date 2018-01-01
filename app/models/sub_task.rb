class SubTask < ApplicationRecord
  validates :name, :description, :assignee, :assigner, :due_date, presence: true

  belongs_to :task,
    primary_key: :id,
    foreign_key: :task_id,
    class_name: :Task

  belongs_to :assignee,
    primary_key: :id,
    foreign_key: :assignee_id,
    class_name: :Employee

  belongs_to :assigner,
    primary_key: :id,
    foreign_key: :assigner_id,
    class_name: :Employee

  has_many :departments,
    through: :departmentSubTasks,
    source: :department
end
