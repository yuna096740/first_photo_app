class Photo < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :photo_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
