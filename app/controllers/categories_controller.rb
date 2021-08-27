class CategoriesController < ApplicationController

      
  def index #index.html.erb
    @category = Category.all 

  end 

  def show
    begin 
    @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts "Error #{e}"
      flash[:alert] = "Article Not Found"
      render :show
    end  
  end 

  def find_name
    @category = Category.find_by(name: params[:name])
  end 

  def new
    @category = Category.new
  end
 
  def create
    @category = Category.new(article_params)

    # @article.name = params[:name] 
    # @article.body = params[:body] 

    if @category.save
    redirect_to categories_path
    else 
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else 
      render :edit
    end
  end 

  def delete
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else 
      render :index
    end
  end 

  private

  def category_params
    params.require(:category).permit(:category_of_task, :remarks)
  end

end
