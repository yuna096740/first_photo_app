class Photo < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :photo_comments, dependent: :destroy
end
