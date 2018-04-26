class Applying < ApplicationRecord
  validates :target_id, uniqueness: { scope: :user_id }

  belongs_to :user
  belongs_to :target, class_name: 'User'
end
