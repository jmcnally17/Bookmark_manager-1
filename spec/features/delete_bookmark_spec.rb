require 'pg'

feature "Deleting a bookmark" do
  scenario "removes the bookmark from the list" do
    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
