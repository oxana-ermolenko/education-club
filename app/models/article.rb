class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :article_categories
  has_many :categories, through: :article_categories
end
