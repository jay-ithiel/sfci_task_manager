@tasks.each do |task|
  json.set! task.id do
    json.extract! task,
      :id,
      :name,
      :description,
      :assignee_id,
      :assigner_id,
      :due_date,
      :sub_tasks,
      :departments,
      :assigner,
      :assignee
  end
end
