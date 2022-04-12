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
   erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/create' do
    p params
    redirect '/bookmarks/confirmation'
  end

  get '/bookmarks/confirmation' do
    erb :'bookmarks/confirmation'
  end
end
