module PostsHelper
  def is_collected?(user)
    self.collected_users.include?(user)
  end

  def can_read?(current_user)
    (self.privacy == "all" || self.privacy == "only read") || (self.privacy == "myself" && self.user == current_user) || (self.privacy == "friend" && (self.user.friend?(current_user) || self.user == current_user))
  end
  
end
