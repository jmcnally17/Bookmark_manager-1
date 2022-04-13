require './app.rb'
require './lib/bookmark.rb'
require 'pg'

describe Bookmark do
    describe '.all' do
    it 'should display an array of bookmarks - seperated' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")  
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')

    end

    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.bbc.co.uk')
      expect(Bookmark.all).to include 'http://www.bbc.co.uk'
    end
end
end