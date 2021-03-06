require 'rails_helper'

RSpec.describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information for a specific article' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path

      click_link article_1.title
      
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
