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
  assignee_id: number
  assigner_id: number
  due_date: date
  completed: boolean

  belongs_to :assigner
  belongs_to :assignee
  has_many :departments


DepartmentTasks
  department_id: number
  task_id: number


EmployeeDepartments
  department_id: number
  employee_id: number



employees
  id: number
  first_name: string
  last_name: string
  username: string
  email: string
  password_digest: string
  session_token: string


departments
  id: number
  name: string


tasks
  id: number
  name: string
  description: text
  assignee_id: number
  assigner_id: number
  due_date: date
  completed: boolean


employeeDepartments
  id: number
  employee_id: number
  department_id: number


departmentTasks
  id: number
  department_id: number
  task_id: number
