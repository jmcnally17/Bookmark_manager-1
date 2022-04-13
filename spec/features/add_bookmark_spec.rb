require 'pg'

feature 'New bookmark' do
  scenario 'to fill out form and submit new bookmark' do
  visit('/bookmarks/new')
  fill_in 'url', with: 'www.twitch.com'
  click_button('Submit')
  expect(page).to have_content('www.twitch.com')
  end
end