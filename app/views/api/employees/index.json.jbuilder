@employees.each do |employee|
  json.set! employee.id do
    json.extract! employee,
      :id,
      :first_name,
      :last_name,
      :username,
      :email,
      :image_url,
      :departments,
      :tasks,
      :sub_tasks
  end
end
