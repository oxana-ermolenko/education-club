class Task < ApplicationRecord
  belongs_to :project

  STATUS_OPTIONS = [['Backlog', 'backlog'], 
  ['In-progress', 'in-progress'], 
  ['In-review', 'in-review'],
  ['Done', 'done']]

  PRIORITY_OPTIONS = [['High', 'high'], 
  ['Medium', 'medium'], 
  ['Low', 'low']]
  
  
end
