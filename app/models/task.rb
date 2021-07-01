class Task < ApplicationRecord
  belongs_to :project



  STATUS_OPTIONS = [['Backlog', 'backlog'], 
  ['In-progress', 'in-progress'], 
  ['In-review', 'in-review'],
  ['Done', 'done']]

  def badge_color
    case status
    when 'not-started'
      'warning'
    when 'in-progress'
      'info'
    when 'in-review'
      'orange'
    when 'done'
      'success'
    end
  end

  def done?
    status == 'done'  
  end

  def in_progress?
    status == 'in-progress'
  end

  def in_review?
    status == 'in-review'
  end

  def backlog?
    status == 'backlog'
  end
end
