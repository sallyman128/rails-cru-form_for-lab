class SongsController < ApplicationController
  
  def create
    @song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  def show
    @song = Song.find(params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end

  def update
    @song = Song.update(params.require(:song).permit(:name))
    redirect_to song_path(@song)
  end
  
  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end
end