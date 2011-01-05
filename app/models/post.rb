class Post
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps
  
  field :title
  slug  :title
  field :body

  validates_presence_of :title
  validates_presence_of :body

  index [[:created_at, Mongo::DESCENDING]]
  
  default_scope desc(:created_at)
  
  embeds_many :comments, :as => :commentable
end