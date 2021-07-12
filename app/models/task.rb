class Task < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :steps, presence: true, length: { minimum: 2, maximum: 10000 }
  validates :project_id, presence: true
  belongs_to :project

  STATUS_OPTIONS = [['Backlog', 'backlog'], 
  ['In-progress', 'in-progress'], 
  ['In-review', 'in-review'],
  ['Done', 'done']]

  PRIORITY_OPTIONS = [['High', 'high'], 
  ['Medium', 'medium'], 
  ['Low', 'low']]
  
  
end
