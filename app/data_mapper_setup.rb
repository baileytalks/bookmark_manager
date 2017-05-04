require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tag'
require_relative 'models/link'

DataMapper::Logger.new(STDOUT, :debug) if ENV['RACK_ENV'] == 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] ||
"postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
