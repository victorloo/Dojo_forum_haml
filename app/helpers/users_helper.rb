module UsersHelper
  def all_friends
    my_friends = self.friends
    inverse_friends = self.inverse_friends
    all_friends = (my_friends + inverse_friends).uniq.sort
  end
end
