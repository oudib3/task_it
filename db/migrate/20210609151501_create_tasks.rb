class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
