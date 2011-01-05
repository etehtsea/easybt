class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content
  
  embedded_in :commentable, :inverse_of => :comments
  referenced_in :user
end
