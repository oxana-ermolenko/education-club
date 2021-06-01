def show
  @user = User.find(params[:id])
  @user_articles = @user.articles.all
end