# TASK MANAGER
- user
- password

- department
- due date
- who is responsible
- tasks
  - sub-tasks
- add pictures
- recurring tasks
- weeks
- color code everything

- sort by department
- sort by date
- sort by name
- sort by task


# EVENT MANAGEMENT


# Models
Employee
  username/email: string
  password: string
  session_token: string

  has_many :tasks
  has_many :departments


Department
  name: string
  has_many :employees
  has_many :tasks


Task
  task_name: string
  assignee_id: integer
  assigner_id: integer
  due_date: date
  completed: boolean

  belongs_to :assigner
  belongs_to :assignee
  has_many :departments


DepartmentTasks
  department_id: integer
  task_id: integer


EmployeeDepartments
  department_id: integer
  employee_id: integer



employees
  id: integer
  first_name: string
  last_name: string
  username: string
  email: string
  password_digest: string
  session_token: string


departments
  id: integer
  name: string


tasks
  id: integer
  name: string
  description: text
  assignee_id: integer
  assigner_id: integer
  due_date: date
  completed: boolean


employeeDepartments
  id: integer
  employee_id: integer
  department_id: integer


departmentTasks
  id: integer
  department_id: integer
  task_id: integer
