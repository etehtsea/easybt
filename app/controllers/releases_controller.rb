class ReleasesController < InheritedResources::Base
  load_and_authorize_resource :except => :browse
  skip_authorization_check :only => :browse
  defaults :finder => :find_by_slug
  after_filter :check_stats, :only => :show

  def show
    show! do |format|
      format.html
      format.json { render json: @release.attributes['stats'] }
    end
  end

  def browse
    @releases = if params[:subid]
      Release.with_subcategory(params[:subid])
    else
      Release.with_category(params[:id])
    end
  end

  private

  def check_stats
    @release.update_stats
  end
end
