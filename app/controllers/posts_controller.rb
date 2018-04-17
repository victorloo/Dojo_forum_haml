class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.order(id: :asc).page(params[:page]).per(5)
  end

  def show
    @categories = @post.folders
  end

  def new
    @post = current_user.posts.build
    @all_categories = Category.all
    @folder = @post.folders.build
  end

  def create
    @post = current_user.posts.build(post_params)
    
    params[:categories][:id].each do |category|
      if !category.empty?
        @post.folders.build(:category_id => category)
      end
    end
        
    if @post.save
      redirect_to @post, notice: "You Created a Post!"
    else
      render 'new'
    end
  end

  def edit
    @all_categories = Category.all
    @folder = @post.folders.build
  end

  def update
    folders = Folder.where(post: @post)
    folders.destroy_all

    params[:categories][:id].each do |category|
      if !category.empty?
        @post.folders.build(:category_id => category)
      end
    end

    if @post.update(post_params)
      redirect_to @post, notice: "You Updated this Post!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, alert: "You Deleted this Post!!!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
