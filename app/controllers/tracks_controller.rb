class TracksController < ApplicationController
  
  def index
    @album = Album.find(params[:album_id])
    @tracks = @album.tracks
    render :index
  end
  
  def show
    @track = Track.find(params[:id])
    render :show
  end
  
  def new
    @track = Track.new
    render :new
  end
  
  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end
  
  def edit
    @track = Track.find(params[:id])
    render :edit
  end
  
  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_tracks_url
  end
  
  private
  
  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
  
end
