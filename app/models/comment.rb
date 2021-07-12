class Comment < ApplicationRecord
  validates :body, presence: true, length: { minimum: 2, maximum: 300 }
  validates :user_id, presence: true
  validates :article_id, presence: true
  belongs_to :user
  belongs_to :article
  default_scope -> { order(updated_at: :desc)} 
end
