class CommentsController < InheritedResources::Base
  belongs_to :post, :release,
             :polymorphic => true,
             :finder => :find_by_slug

  def create
    create! { polymorphic_url(parent) }
  end

  def update
    update! { polymorphic_url(parent) }
  end

  def destroy
    destroy! { polymorphic_url(parent) }
  end
end
