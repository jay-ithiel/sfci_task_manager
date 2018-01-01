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
  has_many :sub_tasks
  has_many :departments


Department
  name: string

  has_many :employees
  has_many :tasks
  has_many :sub_tasks, through: :departmentSubTasks, source: :sub_task


EmployeeDepartments
  department_id: integer
  employee_id: integer

  belongs_to :department
  belongs_to :employee


Task
  task_name: string
  description: text
  assignee_id: integer
  assigner_id: integer
  due_date: datetime
  is_completed: boolean

  belongs_to :assigner
  belongs_to :assignee
  has_many :departments
  has_many :sub_tasks


SubTask
  subtask_name: string
  description: text
  task_id: integer
  assignee_id: integer
  assigner_id: integer
  due_date: datetime
  is_completed: boolean

  belongs_to :task
  belongs_to :assignee
  belongs_to :assigner
  has_many :departments, through: :departmentSubTasks, source: department


DepartmentTasks
  department_id: integer
  task_id: integer

  belongs_to :department
  belongs_to :task


DepartmentSubTasks
  department_id: integer
  sub_task_id: integer

  belongs_to :department
  belongs_to :sub_task








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
