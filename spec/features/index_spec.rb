require './app'

feature 'View bookmarks' do
  scenario 'View bookmark title' do
    visit('/')
    expect(page).to have_content('This is your bookmark manager')
  end
end