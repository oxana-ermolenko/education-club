class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@rticle)
    else
      flash.now[:danger] = "error"
      redirect_to articles_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
