class ReleasesController < InheritedResources::Base
  after_filter :check_stats, :only => :show
  defaults :finder => :find_by_slug

  def show
    show! do |format|
      format.html
      format.json { render json: @release.attributes['stats'] }
    end
  end

  private

  def check_stats
    @release.update_stats
  end
end
