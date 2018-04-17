class Category < ApplicationRecord
  validates :name, presence: true

  has_many :folders, dependent: :destroy
  has_many :posts, through: :folders
end