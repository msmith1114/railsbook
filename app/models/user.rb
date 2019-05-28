class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :posts
  has_many :comments
  has_many :likes
  has_one_attached :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  def pending_requests
    self.friendships.select {|friendship| friendship.status == "Pending"}
  end 

  def friends?(current_user)
    Friendship.exists?(user_id: current_user, friend_id: self)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

end
