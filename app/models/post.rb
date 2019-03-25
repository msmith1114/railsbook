class Post < ApplicationRecord
  validates :content, presence: true, length: {minimum: 6,  maximum: 500 }
  belongs_to :user
  has_many :comments
  has_many :likes
end
