class ArticlesController < ApplicationController
    #GET /articles
    def index
        @articles = Article.all
    end

    #GET /articles/show:id
    def show
        @article = Article.find(params[:id])
    end

    #GET /articles/new
    def new
        @article = Article.new
    end

    #POST /articles
    def create
        @article = Article.new(article_params)

        #guarda base de datos
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    #PUT /articles/:id
    def update
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    #Strong params
    def article_params
        params.require(:article.permit(:title, :body))
    end

end