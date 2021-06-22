class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :tasks, dependent: :destroy
  
  def total_complete
    tasks.select { |task| task.complete? }.count
  end

  def total_tasks
    tasks.count
  end
end
