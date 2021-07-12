class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2, maximum: 10000 }
  validates :user_id, presence: true
  default_scope -> { order(updated_at: :desc)} 
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :article_categories
  has_many :categories, through: :article_categories

  def total_comments
    comments.count
  end
end
