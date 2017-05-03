## This class understands how to add links to our bookmark manager database
class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
end
