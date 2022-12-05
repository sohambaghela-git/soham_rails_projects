class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "abc", password: "12345", except: [:index, :show]
  # Home Page
  def index
    @articles=Article.all
  end

  # Read Data
  def show 
    @article=Article.find(params[:id])
  end

  # To Create New Article
  def new 
    @article=Article.new 
  end
  # To Create New Article
  def create 
    @article=Article.new(article_params)
    # To Save data in DB 
    if @article.save
      redirect_to @article 
    else  
      render :new, status: :unprocessable_entity 
    end
  end
  # To Edit Article data from DB with the help of Model
  def edit 
    @article=Article.find(params[:id])
  end
  def update 
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else  
      render :edit, status: :unprocessable_entity 
    end
  end

  # To Delete data From DB with the help of Model
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # Come back from Operation
    redirect_to root_path, status: :see_other
  end

  # To give permition to data to connect with DB 
  private 
    def article_params 
      params.require(:article).permit(:heading, :data, :status)
    end

end
