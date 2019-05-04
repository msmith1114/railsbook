class Like < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates  :user, uniqueness: { scope: :post, message: "You already liked this post" }
end
