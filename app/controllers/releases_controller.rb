class ReleasesController < InheritedResources::Base
  after_filter :check_stats, :only => :show
  defaults :finder => :find_by_slug

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
