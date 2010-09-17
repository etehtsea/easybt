class ReleasesController < ApplicationController
  CATEGORIES = {
   'Audio'        => ['Music', 'A-books'],
   'Video'        => ['Movies','Serials'],
   'Applications' => ['Windows', 'Unix', 'Mac'],
   'Games'        => ['Pc', 'Mac', 'Console'],
   'Other'        => ['E-books', 'Pictures', 'Comics']
  }
  TRACKER_URI = "http://fileshare.su:6969"

  before_filter :authorize!,  :except => [:index, :show]

  # GET /releases/new
  def new
    @release = Release.new
  end

  # POST /releases
  def create
    @release      = Release.new(params[:release])
    @release.user = current_user

    if @release.save
      redirect_to(@release, :notice => 'Release was successfully created.')
    else
      render :action => "new"
    end
  end

  # GET /releases/1
  def show
    @release = Release.find_by_slug(params[:id])
  end

  # GET /releases
  def index
  end

  # GET /releases/1/edit
  def edit
    @release = Release.find_by_slug(params[:id])
  end

  # GET /category/:id(:subid/)
  def browse
    if params[:subid]
      @releases = Release.by_cat(params[:id]).by_subcat(params[:subid])
    else
      @releases = Release.by_cat(params[:id])
    end
  end

  # PUT /releases/1
  def update
    @release = Release.find_by_slug(params[:id])

      if @release.update_attributes(params[:release])
        redirect_to(@release, :notice => 'Release was successfully updated.')
      else
        render :action => "edit"
      end
  end

  # DELETE /releases/1
  def destroy
    @release = Release.find_by_slug(params[:id])
    @release.destroy

    redirect_to(releases_url)
  end

  private

    def authorize!
        authenticate_user! if !admin_signed_in?
    end
end

