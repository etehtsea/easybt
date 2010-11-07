class ReleasesController < ApplicationController
  load_and_authorize_resource :find_by => :slug,
                              :except => :browse
                      
  # POST /releases
  def create
    @release.user = current_user

    if @release.save
      redirect_to(@release, :notice => 'Release was successfully created.')
    else
      render :action => "new"
    end
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
    if @release.update_attributes(params[:release])
        redirect_to(@release, :notice => 'Release was successfully updated.')
      else
        render :action => "edit"
      end
  end

  # DELETE /releases/1
  def destroy
    @release.destroy
    
    redirect_to(releases_url)
  end
end