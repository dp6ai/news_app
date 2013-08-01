class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		
	end

	def create
		Article.create(title: params[:article_title], body: params[:article_body])
		redirect_to articles_url
	end

	def show
		@title = Article.find(params[:id]).title
		@body = Article.find(params[:id]).body
		@id = params[:id]
	end

	def edit
		@title = Article.find(params[:id]).title
		@body = Article.find(params[:id]).body
		@id = params[:id]
	end
	def update
  		@article = Article.find(params[:id])
  		puts params[:article_title]
  		puts params[:article_body]
  		puts @article.title
  		puts @article.body
 
  		@article.update(title: params[:article_title], body: @article.body)  if !params[:article_title].empty?
  		@article.update(title: @article.title, body: params[:article_body]) if !params[:article_body].empty?

    	redirect_to @article
	end
end


