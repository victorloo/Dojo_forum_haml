class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, except: [:create]
  
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!

    @post.lastreplies = @comment.created_at
    @post.save
  end

  def destroy
    @comment.destroy && find_post if current_user.admin?
  end

  def edit
  end

  def update
    @comment.update(comment_params) && find_comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end