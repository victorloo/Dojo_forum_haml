class Api::V1::PostsController < ApiController
  before_action :authenticate_user!, except: :index
  def index
    published = Post.all.where(status: "published")
    @posts = published.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    if !@post
      render json: {
        message: "The post flied to heaven.",
        status: 400
      }
    else
      render 'api/v1/posts/show'
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

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      render json: {
        message: "Post updated successfully!",
        result: @post
      }
    else
      render json: {
        errors: @post.errors
      }
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: {
      message: "Post destroyed successfully!"
    }
  end

  private
  def post_params
    params.permit(:title, :content, :image, :privacy, :status)
  end
  
end
