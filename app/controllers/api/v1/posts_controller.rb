class Api::V1::PostsController < ApiController
  def index
    published = Post.all.where(status: "published")
    @posts = published.all
    render json: {
      data: @posts.map do |post|
        {
          title: post.title,
          content: post.content,
          author: post.user.name
        }
      end
    }
  end
  
end
