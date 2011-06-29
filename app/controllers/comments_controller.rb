class CommentsController < InheritedResources::Base
  belongs_to :post, :release,
             :polymorphic => true,
             :finder => :find_by_slug

  load_resource :post
  load_resource :release
  load_and_authorize_resource :comment, :through => [:post_id, :release_id]

  def create
    create! { polymorphic_url(parent) }
    @comment.user = current_user
    @comment.save!
  end

  def update
    update! { polymorphic_url(parent) }
  end

  def destroy
    destroy! { polymorphic_url(parent) }
  end
end
