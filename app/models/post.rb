class Post
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :title
  slug  :title
  field :body

  validates_presence_of :title
  validates_presence_of :body

  index [[:created_at, Mongo::DESCENDING]]

  class << self
    def find_by_slug(id)
      where(:slug => id).first
    end
  end
end