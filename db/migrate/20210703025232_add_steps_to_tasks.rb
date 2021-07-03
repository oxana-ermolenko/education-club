class AddStepsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :steps, :text
  end
end
