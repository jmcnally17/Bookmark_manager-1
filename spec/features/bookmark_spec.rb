feature 'Viewing bookmarks' do
  scenario 'view bookmark' do
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
  end

  scenario 'view bookmark that have been hard coded' do
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.github.com')
    expect(page).to have_content('www.youtube.com')
  end
end