json.(post, :title, :content)
json.author do
  json.name post.user.name
end