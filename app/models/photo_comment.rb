class PhotoComment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
validates :comment, length: { minimum: 2, maximum: 50 }
end
