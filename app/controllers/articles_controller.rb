class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was created successfully!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])  
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = "Article was updated successfully!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "Article deleted successfully"
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, category_ids: [])
    end
end
