class ReleasesController < InheritedResources::Base
  after_filter :check_stats, :only => :show

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
