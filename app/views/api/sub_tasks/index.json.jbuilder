@sub_tasks.each do |sub_task|
  json.set! sub_task.id do
    json.extract! sub_task,
      :id,
      :name,
      :description,
      :assignee_id,
      :assigner_id,
      :due_date,
      :departments,
      :task,
      :assignee,
      :assigner
  end
end
