class ReleasesController < InheritedResources::Base
  def show
    show! do |format|
      format.html
      format.json { render json: @release.attributes['stats'] }
    end
  end
end
