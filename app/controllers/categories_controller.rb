class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save 
      flash[:success] = "Category was created successfully!"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end