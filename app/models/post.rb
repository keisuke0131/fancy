class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true


  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
