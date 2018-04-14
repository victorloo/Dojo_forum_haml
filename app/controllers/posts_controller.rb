class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :asc)
  end
end
