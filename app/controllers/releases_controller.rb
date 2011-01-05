class ReleasesController < InheritedResources::Base
  load_and_authorize_resource :except => :browse
  defaults :finder => :find_by_slug

  # POST /releases
  def create
    @release.user = current_user
    create!
  end

  # GET /category/:id(:subid/)
  def browse
    if params[:subid]
      @releases = Release.by_cat(params[:id]).by_subcat(params[:subid])
    else
      @releases = Release.by_cat(params[:id])
    end
  end
end