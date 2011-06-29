class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  embedded_in :commentable, polymorphic: true

  belongs_to :user

  delegate :email, :to => :user, :prefix => true
end
