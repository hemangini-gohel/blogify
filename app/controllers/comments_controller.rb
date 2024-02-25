
class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :authenticate_user!
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/form', locals: { comment: @comment }) }
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
