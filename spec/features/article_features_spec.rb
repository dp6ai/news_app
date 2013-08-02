require 'spec_helper'

Article.delete_all
#rake db:migrate RAILS_ENV=test

describe 'no rticles on the articles page' do

	it 'should display no users if there are none' do

		visit '/articles'
		expect(page).to have_content  'No Users'
	end

end

describe 'seeing an article on the articles page' do

	before(:all){Article.create(title: "My Title", body: "Some body text")}

     it 'should display a newly created article on /articles' do
     visit '/articles'
     expect(page).to have_css 'td', text:'My Title'
     expect(page).to have_content  'Some body text'
     end

     it 'should have a link to the item' do
     visit '/articles'
     expect(page).to have_css 'a', text: "My Title"
     end

     it 'should have a link that views the item' do
     	visit '/articles'
     	click_link('My Title')
     	expect(page).to have_css 'h1', text: "My Title"
     end

     it 'should have an edit link that loads the edit page' do
     	visit '/articles'
     	click_link('edit')
     	expect(page).to have_css 'h2', text: "Edit Article My Title"
     end
end

describe 'cretaing a new article' do

	it 'should be cretaed by a form at /articles/new' do
		visit '/articles/new'
			within '#new_articles' do
				fill_in 'Title', with: 'Some title'
				fill_in 'Body', with: 'Lorem ipsum'
			click_on 'Create'
			end
		expect(page).to have_css 'a', text:'Some title'
	end
end

describe 'editing an article' do

	it 'should be able to chnge the title of an article' do
		visit '/articles'
     	click_link('edit')
#     	within("#edit-form") do 
     		fill_in('article_title', with: 'NEWTITLE')
#     	end
     	click_button('Submit')
     	expect(page).to have_css 'h1', text: "NEWTITLE"
	end

	it 'should be able to change the body of an article' do
		visit '/articles'
     	click_link('edit')
     	fill_in('article_body', with: 'NEWBODY')
     	click_button('Submit')
     	expect(page).to have_css 'p', text: "NEWBODY"
	end
end
