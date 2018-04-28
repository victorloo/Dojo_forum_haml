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

  def show
    @post = Post.find_by(id: params[:id])
    if !@post
      render json: {
        message: "The post flied to heaven.",
        status: 400
      }
    else
      render json: {
        title: @post.title,
        content: @post.content,
        author: @post.user.name
      }
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save 
      render json: {
        message: "Post created successfully!",
        result: @post
      }
    else
      render json: {
        errors: @post.errors
      }
    end
  end

  private
  def post_params
    params.permit(:title, :content, :image, :privacy, :status)
  end
  
end
