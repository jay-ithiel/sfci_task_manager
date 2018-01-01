class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string, :name, null: false
      t.text :description, null: false
      t.number :assignee_id, null: false
      t.number :assigner_id, null: false
      t.datetime :due_date, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
