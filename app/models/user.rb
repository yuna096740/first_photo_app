class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photos, dependent: :destroy
  has_many :photo_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :icon

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :revers_of_relationships, class_name: "Relationship", foreign_key: "followwed_id" ,dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :revers_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
