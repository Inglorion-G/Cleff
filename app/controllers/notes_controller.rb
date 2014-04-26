class NotesController < ApplicationController
  
  def index
    @notes = Note.all
    render :index
  end
  
  def show
    @note = Note.find(params[:id])
    render :show
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @track = Track.find(params[:track_id])
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    if @note.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :new
    end
  end
  
  def edit
    @note = Note.find(params[:id])
    render :edit
  end
  
  def update
    @track = Track.find(params[:track_id])
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @note.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy
    redirect_to track_url(@track)
  end
  
  private
  
  def note_params
    params.require(:note).permit(:title, :body)
  end
  
end