class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id]) #commented out after adding before_action 'set_article'
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

    flash.notice = "Article '#{@article.title}' Created!'"

    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    # @article.destroy
    # redirect_to articles_path

    # Article.destroy(params[:id]) #commented out after adding before_action 'set_article'
    @article.destroy

    flash.notice = "Article Deleted!"

    redirect_to articles_path
  end

  def edit
    # @article = Article.find(params[:id]) #commented out after adding before_action 'set_article'
  end

  def update #getting @article = Article.find(params[:id]) from before_action
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
