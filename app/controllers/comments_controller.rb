class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast "comments", render(partial: 'comments/comment', object: @comment)
      #redirect_to article_path(@rticle)
    else
      flash.now[:danger] = "error"
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
