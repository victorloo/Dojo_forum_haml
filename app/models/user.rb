class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :posts

  has_many :comments, dependent: :destroy

  has_many :views, dependent: :destroy
  has_many :viewed_posts, through: :views, source: :post

  has_many :collections, dependent: :destroy
  has_many :collected_posts, through: :collections, source: :post

  USER_ROLE = [
    ['Normal', :normal],
    ['Admin', :admin]
  ]

  def admin?
    self.role == "admin"
  end
end
