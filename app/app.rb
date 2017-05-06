ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

## This class understands how to run the Bookmark Manager app
class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    @user = User.last
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tags_array = params[:tags].split(', ')
    tags_array.each do |tag_name|
      new_tag = Tag.first_or_create(tag: tag_name) unless tag_name.nil?
      link.tags << new_tag
      link.save
    end
    redirect to('/links')
  end

  get '/tags/:tag_name' do
    tag = Tag.first(tag: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/signup' do
    erb :'user/signup'
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
