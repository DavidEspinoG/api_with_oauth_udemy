class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: ArticleSerializer.new(articles), status: :ok
  end

  def show
    articles = Article.all
    render json: articles, status: :ok
  end

  # def serializer 
  #   ArticleSerializer
  # end
end