class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_projects
  has_many :projects, through: :user_projects

  def full_name
    return "#{first_name} #{last_name}" if first_name or last_name
    'Anonymous'
  end
end
