class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  embedded_in :commentable, polymorphic: true
end
