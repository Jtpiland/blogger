class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    # @article.save
    # redirect_to article_path(@article)

    # @article = Article.new(
    #   title: params[:article][:title],
    #   body: params[:article][:body])
    # @article.save
    # redirect_to article_path(@article)

    # @article = Article.new(params[:article])
    # @article.save
    # redirect_to article_path(@article)

    @article = Article.new(article_params) #above method is close but doesnt work bc of rails security. after strong params are added(section after private below)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    # @article.destroy
    # redirect_to articles_path

    Article.destroy(params[:id])
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
