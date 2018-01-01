class Task < ApplicationRecord
  validates :name, :description, :assignee_id, :assigner_id, :due_date, :completed, presence: true
end
