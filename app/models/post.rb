class Post < ApplicationRecord
  validates :content, presence: true, length: {minimum: 3,  maximum: 500 }
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one_attached :post_image

  def liked?
    self.likes.exists?
  end

end

