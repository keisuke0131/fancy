class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_one_attached :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
