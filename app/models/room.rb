class Room < ApplicationRecord
  validates :name, presence: true
  validates :avatar, presence: true
 
  default_scope -> { order(updated_at: :desc)} 
  has_many :messages, dependent: :destroy,
                           inverse_of: :room

end
