class AddTasksDueDate < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :due_date, :datetime, precision: 6, false: :null
  end
end
