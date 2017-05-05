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
    tags_array = params[:tags].split(', ')
    # while !tags.empty?
      tags_array.each do |tag_name|
        new_tag = Tag.first_or_create(tag: tag_name) unless tag_name.nil?
        link.tags << new_tag
        link.save
      end
    # end
    redirect to('/links')
  end

  get '/tags/:tag_name' do
    tag = Tag.first(tag: params[:tag_name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
