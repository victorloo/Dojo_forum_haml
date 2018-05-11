class Post < ApplicationRecord
  include PostsHelper
  #mount_uploader :image, ImageUploader
  validates :title, :content, :privacy, :status, presence: true
  belongs_to :user

  has_many :folders, dependent: :destroy
  has_many :categories, through: :folders

  has_many :comments, dependent: :destroy

  has_many :views, dependent: :destroy
  has_many :viewed_users, through: :views, source: :user

  has_many :collections, dependent: :destroy
  has_many :collected_users, through: :collections, source: :user

  POST_PRIVACY = [
    ['All', :all],
    ['Only Read', 'only read'],
    ['Friend', :friend],
    ['Myself', :myself]
  ]
  POST_STATUS = [
    ['Save as Draft', :draft],
    ['Published', :published]
  ]

  def self.readable_posts(user)
    Post.where(privacy: "friend", user: user.all_friends).or(where(privacy: "all")).or(where(privacy: "myself", user: user)).or(where(user: user))
  end
  
end
