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
  devise :omniauthable, omniauth_providers: %i[facebook]

         
  def pending_requests
    self.friendships.select {|friendship| friendship.status == "Pending"}
  end 

  def friends?(current_user)
    Friendship.exists?(user_id: current_user, friend_id: self)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def marital_status_wordify
    case self.marital_status
    when 1
      return "Single"
    when 2
      return "Married"
    when 3
      return "It's Complicated"
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name, user.last_name = auth.info.name.split(" ")  # assuming the user model has a name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
