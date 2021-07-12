class Category < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :article_categories
  has_many :articles, through: :article_categories
  
end
