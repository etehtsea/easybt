class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]

  # GET /posts
  def index
    @posts = Post.order_by([:created_at, :desc])
  end

  # GET /posts/1
  def show
    @post = Post.find_by_slug(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end


  # GET /posts/1/edit
  def edit
    @post = Post.find_by_slug(params[:id])
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
    @post = Post.find_by_slug(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(@post, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
end