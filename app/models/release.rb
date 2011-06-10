class Release
  include Mongoid::Document

  field :title
  field :description

  validates :title, :presence => true
end
