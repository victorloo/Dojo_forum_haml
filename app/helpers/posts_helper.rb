module PostsHelper
  def is_collected?(user)
    self.collected_users.include?(user)
  end
  
end
