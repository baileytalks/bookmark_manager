ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

## This class understands how to run the Bookmark Manager app
class BookmarkManager < Sinatra::Base
  configure :development do
    enable :logging, :dump_errors, :raise_errors
    disable :show_exceptions
    DataMapper::Logger.new(STDOUT, :debug, '[DataMapper] ')
    DataMapper::Model.raise_on_save_failure = true
  end

  configure :test do
    enable :dump_errors, :raise_errors
    disable :run, :logging, :show_exceptions
  end

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

  get '/tags/:tag_name' do
    @tag = :tag_name
    @tagged_links = Link.all(:tag_name = @tag)
    erb :'tags'
  end
end
