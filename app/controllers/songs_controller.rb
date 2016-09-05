class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
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
