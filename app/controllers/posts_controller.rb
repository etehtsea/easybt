class PostsController < InheritedResources::Base
  load_and_authorize_resource
  defaults :finder => :find_by_slug
end
