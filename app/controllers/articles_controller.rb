class ArticlesController < ApplicationController
    respond_to :json, :html
    helper_method :articles, :article
    #before_filter :remove_id

    def index
      respond_with articles
    end
    
    def new
      respond_with article
    end
    
    def create
      article.save
      respond_with article, :location => :articles
    end
    
    def show
      render :action => :new
    end
    
    def update
      article.update_attributes(params[:article])
      respond_with article
    end
    
    def destroy
      article.destroy
      respond_with article
    end

  protected

    def article
      @article ||= params[:id].present? ? Article.find(params[:id]) : Article.new(params[:article])
    end
    
    def articles
      @articles ||= Article.all
    end
    
    def remove_id
      params[:article].delete("id") if (params[:article] || {}).has_key? "id"
    end
end

