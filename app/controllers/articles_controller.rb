class ArticlesController < ApplicationController

#this allows you to go to /articles.json
		respond_to :html, :json


	def index
		@articles = Article.all
		#this allows you to go to /articles.json and it returns @articles.to_json
		#respond_with @articles
		# respond_with @articles do |format|
		# 	format.html
		# 	format.json {render json: @articles.as_json(only [:id, :title, :body])}
		# end
		# THIS CAN BE REMOVED BECAUSE WERE USING JBUILDER
	end

	def new
		
	end

	def create
		@article = Article.new(title: params[:article_title], body: params[:article_body])

		if @article.save
			flash[:message] = "Successfully Saved!"
			redirect_to articles_url
		else
			render :new
		end
	end

	def show
		@title = Article.find(params[:id]).title
		@body = Article.find(params[:id]).body
		@id = params[:id]
		@article = Article.find(@id)
		@comments = @article.comments
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