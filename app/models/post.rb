class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
