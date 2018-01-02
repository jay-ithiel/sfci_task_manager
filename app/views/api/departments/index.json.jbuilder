@departments.each do |department|
  json.set! department.id do
    json.extract! department,
      :id,
      :name,
      :employees,
      :tasks,
      :sub_tasks
  end
end
