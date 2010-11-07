class PostsController < ApplicationController
  load_and_authorize_resource :find_by => :slug,
                              :except => :index                    

  # GET /posts
  def index
    @posts = Post.order_by([:created_at, :desc])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to(@post, :notice => 'Post was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /posts/1
  def update
    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    redirect_to(posts_url)
  end
end