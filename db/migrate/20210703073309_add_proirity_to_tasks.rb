class AddProirityToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :string
  end
end
