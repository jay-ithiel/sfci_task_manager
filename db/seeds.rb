Employee.create(first_name: 'Jay', last_name: 'Ithiel', username: 'jay_ithiel', email: 'jay@ithiel.com', password: 'password')

Employee.create(first_name: 'Alex', last_name: 'Quock', username: 'alex_quock', email: 'alex@quock.com', password: 'password')


Department.create(name: "Missions")
Department.create(name: "AAB")
Department.create(name: "Development")
Department.create(name: "School")
Department.create(name: "Music")


Task.create(name: "Task 1", description: "Task 1 description", assignee_id: 2, assigner_id: 1, due_date: Date.new(2018, 1, 21) )

SubTask.create(name: "Subtask 1", description: "Subtask 1 description", task_id: 1, assignee_id: 2, assigner_id: 1, due_date: Date.new(2018,1,21))
