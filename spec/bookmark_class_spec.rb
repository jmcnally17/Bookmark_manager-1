require './app.rb'
require './lib/bookmark.rb'

describe Bookmark do
    describe '.all' do
    it 'should display an array of bookmarks - seperated' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('www.google.com')
    end
end
end