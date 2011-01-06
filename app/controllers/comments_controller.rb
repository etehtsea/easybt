class CommentsController < InheritedResources::Base
  belongs_to :post, :release,
             :polymorphic => true,
             :finder => :find_by_slug
  
  load_and_authorize_resource :post, :find_by => :slug
  load_and_authorize_resource :release, :find_by => :slug

  load_and_authorize_resource :comment, :through => [:post, :release]
  
  def create
    create! { :back }
    @comment.user = current_user
    @comment.save
  end
  
  def update
    update! { polymorphic_url(parent) }
  end
  
  def destroy
    destroy! { :back }
  end
end