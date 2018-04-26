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

  has_many :applyings, dependent: :destroy
  has_many :targets, through: :applyings

  has_many :inverse_applyings, class_name: "Applying", foreign_key: "target_id"
  has_many :applicants, through: :inverse_applyings, source: :user

  has_many :confirmations, dependent: :destroy
  has_many :friends, through: :confirmations

  has_many :inverse_confirmations, class_name: "Confirmation", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_confirmations, source: :user

  has_many :disregards, dependent: :destroy
  has_many :nobodys, through: :disregards

  USER_ROLE = [
    ['Normal', :normal],
    ['Admin', :admin]
  ]

  def admin?
    self.role == "admin"
  end
end
