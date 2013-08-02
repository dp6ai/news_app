class CommentsController < ApplicationController

		respond_to :html, :json

	def index
		@article_id = params[:article_id]
		@article = Article.find(@article_id)
		@comments = @article.comments
		
	end

	def new
		@article_id = params[:article_id]
		@article = Article.find(@article_id)
		@comment = Comment.new
	end

	def create
		@article_id = params[:article_id]
		@article = Article.find(@article_id)

		@comment = @article.comments.new(params[:comment].permit(:commenter, :body))	

		if @comment.save
			flash[:message] = "Successfully Saved!"
			redirect_to action: 'index'
		else
			render :new
		end
	end


end