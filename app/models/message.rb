class Message < ApplicationRecord
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :body, presence: true, length: { minimum: 2, maximum: 500 }
  belongs_to :user
  belongs_to :room, inverse_of: :messages
end
