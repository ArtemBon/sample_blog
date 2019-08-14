class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.order 'created_at DESC'
  end

  def show
    @article = Article.find params[:id]
  end

  def new
  end

  def create
    @article = Article.new articles_params

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update articles_params
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy

    redirect_to articles_path
  end


  private

  def articles_params
    params.require(:article).permit(:title, :text)
  end

end
