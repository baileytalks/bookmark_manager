require 'sinatra/base'
require_relative 'models/link.rb'

## This class understands how to run the Bookmark Manager app
class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end
