require './app.rb'
require './lib/bookmark.rb'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'should display an array of bookmarks - seperated' do
      bookmark = Bookmark.create(title:'Makers', url: 'http://www.makersacademy.com')
      Bookmark.create(title:'Google', url: 'http://www.google.com')
      Bookmark.create(title:'Destroy', url: 'http://www.destroyallsoftware.com')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'youtube', url: 'http://youtube.com')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'youtube'
      expect(bookmark.url).to eq 'http://youtube.com'
    end
  end

end