class ArticlesController < ApplicationController
    def index
      @article = "これは表示される内容です"
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(set_params)
      if @article.valid?
        @article.save
        redirect_to root_path
      else
        redirect_to new_article_path
      end
    end

    private
    
    def set_params
      params[:article].permit(:tweet)
    end
  end