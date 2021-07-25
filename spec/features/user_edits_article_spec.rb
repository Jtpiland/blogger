require 'rails_helper'

RSpec.describe 'user edits an article' do
  describe 'they link from the show page to edit form' do
    it 'edits an article using a form' do

      article_1 = Article.create!(title: "title 1", body: "body 1")

      visit article_path(article_1)

      click_link 'Edit'

      fill_in 'Title', with: "Title 1"
      fill_in 'Body', with: "Body 1"

      click_button 'Update Article'

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("Title 1")
      expect(page).to have_content("Body 1")
      expect(page).to have_content("Article 'Title 1' Updated!")
    end
  end
end
