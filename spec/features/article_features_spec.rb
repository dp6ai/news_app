require 'spec_helper'

def create_article(title, body)
end

describe 'seeing an article on the articles page' do

     xit 'should display a newly created article on /articles' do
     create_article("My Title","Some body text")
     visit '/articles'
     expect(page).to have_css 'h2', text:'My title'
     expect(page).to have_content  'Some body text'

     end
end