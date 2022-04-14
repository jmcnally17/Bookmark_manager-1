require 'pg'

feature "Updating a bookmark" do
  scenario "update an already existing bookmark" do
    bookmark = Bookmark.create(title: 'Makeys', url: 'http://www.makersacademy.co')
    visit '/bookmarks'
    expect(page).to have_link('Makeys', href: 'http://www.makersacademy.co')
    
    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"

    expect(page).to have_field('url', with: 'http://www.makersacademy.co')
    expect(page).to have_field('title', with: 'Makeys')

    fill_in('url', with: 'http://www.makersacademy.com')
    fill_in('title', with: 'Makers')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).not_to have_link('Makeys', href: 'http://www.makersacademy.co')
  end
end
