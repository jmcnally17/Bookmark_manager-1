require 'pg'

feature 'New bookmark' do
  scenario 'to fill out form and submit new bookmark' do
    visit('/bookmarks')
    fill_in 'url', with: 'http://www.twitch.com'
    fill_in 'title', with: 'Twitch'
    click_button('Submit')
    expect(page).to have_link('Twitch', href: 'http://www.twitch.com')
  end
end
