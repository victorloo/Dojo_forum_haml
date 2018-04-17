class Category < ApplicationRecord
  validates :name, presence: true

  has_many :folders, dependent: :destroy
  has_many :folder_posts, through: :folders, source: :post
end