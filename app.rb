require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'This is your bookmark manager'
  end

  get '/bookmarks' do
   @bookmarks = Bookmark.all
   erb :bookmark_view
  end

end
