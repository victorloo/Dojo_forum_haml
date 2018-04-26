module UsersHelper
  def all_friends
    my_friends = self.friends
    inverse_friends = self.inverse_friends
    all_friends = (my_friends + inverse_friends).uniq.sort
  end

  def waiting_friend
    target_friends = self.targets
    be_ignore_friends = self.inverse_nobodys
    all_friends = (target_friends + be_ignore_friends).uniq.sort
  end
end
