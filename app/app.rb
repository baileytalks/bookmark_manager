ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

## This class understands how to run the Bookmark Manager app
class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag  = Tag.first_or_create(tag_name: params[:tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end
end
