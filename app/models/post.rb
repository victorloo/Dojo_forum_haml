class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :content, presence: true
  belongs_to :user
end
