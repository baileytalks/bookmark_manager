## This class understands what a tag is, in relation to a link
class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag_name, String
end
