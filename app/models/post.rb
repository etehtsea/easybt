class Post
  include Mongoid::Document

  field :title
  field :body

  validates :title, :presence => true
end

