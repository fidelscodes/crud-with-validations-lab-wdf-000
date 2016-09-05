class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :released, :release_year, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = set_song
  end

  def edit
    @song = set_song
  end



  private

  def set_song
    Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
