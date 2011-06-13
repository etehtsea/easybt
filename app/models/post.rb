class Post
  include Mongoid::Document
  include Mongoid::Slug

  field :title
  field :body

  slug :title

  validates :title, :presence => true
end

