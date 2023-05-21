class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  has_one_attached :profile_image
  belongs_to :user

end
