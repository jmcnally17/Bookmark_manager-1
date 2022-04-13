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

  post '/bookmarks_new' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
