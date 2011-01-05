class CommentsController < InheritedResources::Base
  belongs_to :post, :release, :polymorphic => true
  
  def create
    if params[:post_id]
      @commentable = Post.find_by_slug(params[:post_id])
    else
      @commentable = Release.find_by_slug(params[:release_id])
    end
    @comment = @commentable.comments.create!(params[:comment])
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, :notice => "Comment created!"
  end
end