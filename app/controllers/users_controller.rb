class UsersController < ApplicationController
  def index
    if params[:search]
      @user = User.search(params[:search])
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.all
    @user_pojects = @user.projects.all
  end
  

  def search
    if params[:user].present?
      @users = User.search(params[:user])
      @users = current_user.except_current_user(@users)
      if @users
        respond_to do |format|
          format.js { render partial: 'users/user_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
          format.js { render partial: 'users/user_result' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a user first name or last name to search"
        format.js { render partial: 'users/user_result' }
      end
    end
  end

  


end