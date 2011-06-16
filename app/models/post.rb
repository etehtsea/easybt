class Post
  include Mongoid::Document
  include Mongoid::Slug

  field :title
  field :body

  slug :title

  embeds_many :comments, as: :commentable

  validates :title, :presence => true
end

