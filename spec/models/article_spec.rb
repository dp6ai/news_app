require 'spec_helper'


describe Article do 
	context 'creating articles' do
		context 'success'do
			it 'should be created when we provide a title and a body' do 
				@article = Article.new(title: 'My title', body: 'Some body text' )
				expect(@article).to be_valid
			end
		end
		context 'failure' do
			it 'should not be created without a title' do
				@article = Article.new( body: 'Some body text' )
				expect(@article).to_not be_valid
			end
			it 'should not be created without a body' do
				@article = Article.new(title: 'My title')
				expect(@article).to_not be_valid
			end
		end
	end

	context 'comments on articles' do
		it 'should be able to have comments' do
			@article = Article.new(title: 'My title', body: 'Some body text' )
			Comment.create(body: 'Foo', commenter:"dave", article: @article)
			expect(@article.comments).to_not be_empty
		end
	end
end

