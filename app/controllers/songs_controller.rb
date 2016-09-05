class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
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
    @song
  end

  def edit
    @song
  end

  def update
    # Calling .valid? after the update returns false. Why?
    if @song.update(song_params(:title, :artist_name, :released, :release_year, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end

  end



  private

  def set_song!
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
