require 'pg'

feature 'New bookmark' do
  scenario 'to fill out form and submit new bookmark' do
  visit('/bookmarks')
  fill_in 'url', with: 'www.twitch.com'
  fill_in 'title', with: 'Twitch'
  click_button('Submit')
  expect(page).to have_link('Twitch', href:'www.twitch.com')
  end
end