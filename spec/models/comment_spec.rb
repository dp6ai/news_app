require 'spec_helper'


describe Comment do 
	context 'creating comment' do
		context 'success'do
			it 'should be create an associated comment for an article' do 
				@article = Article.create(title: 'My title', body: 'Some body text' )
				@comment = @article.comments.new(commenter:'kips', body:'This is my comment')
				expect(@comment).to be_valid
			end
		end

		context 'failure' do
			it 'should not be able to create a comment without a article' do
				@comment = Comment.new( commenter:'kips', body:'This is my comment' )
				expect(@comment).to_not be_valid
			end
			it 'should not be created a comment without a comenter' do
				@article = Article.create(title: 'My title')
				@comment = @article.comments.new( body:'This is my comment')
				expect(@article).to_not be_valid
			end
			it 'should not be created a comment without a body' do
				@article = Article.create(title: 'My title')
				@comment = @article.comments.new(commenter:'kips')
				expect(@article).to_not be_valid
			end

		end

	end

	end

end
