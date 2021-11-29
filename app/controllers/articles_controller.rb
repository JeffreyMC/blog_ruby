class ArticlesController < ApplicationController
    #callbacks
    before_action :authenticate_user!, except: [:show]
    before_action :set_article, except: [:index, :new, :create]
    
    #GET /articles
    def index
        @articles = Article.all
    end

    #GET /articles/show:id
    def show
        @article.update_visits
        @comment = Comment.new
    end

    #GET /articles/new
    def new
        @article = Article.new
    end

    #POST /articles
    def create
        @article = current_user.articles.new(article_params)

        #guarda base de datos
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    # /articles/:id
    def edit
    end

    #PUT /articles/:id
    def update
        if @article.update(article_params)
            redirect_to articles_path
        else
            render :edit
        end
    end


    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    #Strong params
    def article_params
        params.require(:article).permit(:title, :body)
    end

    def validate_user
        redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
    end

    def set_article
        @article = Article.find(params[:id])
    end


end
