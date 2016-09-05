class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true
  validate  :same_song_twice_in_year?
  validate  :invalid_without_release_year?
  validate  :valid_release_year?

  def valid_release_year?
    if self.release_year && self.release_year > Date.today.year
      errors.add(:release_year, "cannot be in the future")
    end
  end

  def invalid_without_release_year?
    if self.released && self.release_year.blank?
      errors.add(:release_year, "cannot be blank if the song has been released")
    end
  end

  def same_song_twice_in_year?
    previous_song = Song.find_by(title: self.title)

    if previous_song && previous_song.release_year == self.release_year
      errors.add(:title, "cannot be the same twice in a year")
    end
  end
end
