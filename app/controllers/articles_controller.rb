class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show]

    def index
        @articles = Article.all
    end

    def new
       @article = Article.new
    end

    def edit
        
    end

    def create 
        #render  plain: params[:article].inspect    
        @article = Article.new(article_params)
        if @article.save
            #do something
            flash[:notice] = "Article created successfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
       
    end

    def update
        
        if @article.update(article_params)
            #do something
            flash[:notice] = "Article updated successfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        
    end

    def destroy     
        @article.destroy
        flash[:notice] = "Article deleted successfuly"
        redirect_to articles_path
    end

    private
        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :description)
        end
end 