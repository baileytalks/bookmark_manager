require 'data_mapper'
require 'dm-postgres-adapter'

## This class understands how to add links to our bookmark manager database
class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
