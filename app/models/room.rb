class Room < ApplicationRecord
  default_scope -> { order(updated_at: :desc)} 
  has_many :messages, dependent: :destroy,
                           inverse_of: :room

end
