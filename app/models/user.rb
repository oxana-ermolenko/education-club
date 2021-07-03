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
    return "#{first_name} #{last_name}" if first_name || last_name
    'Anonymous'
  end

  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.search(param)
    param.strip!
    to_send_back = (first_name_matches(param) + last_name_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end

end
