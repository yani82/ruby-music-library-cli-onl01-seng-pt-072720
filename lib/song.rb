class Song

attr_accessor :name, :genre, :artist


@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist = artist if artist != nil
  self.genre = genre if genre != nil
end

def save
  @@all << self
end

def self.all
    @@all
end

def self.destroy_all
  self.all.clear
end

def self.create(name)
  new_song = Song.new(name)
  new_song.save
  new_song
end

def artist=(artist)
    @artist = artist
    artist.add_song(self)
    artist
end

def genre=(genre)
    @genre = genre
    genre.songs << self if !@genre.songs.include?(self)
end

def self.find_by_name(name)
  self.all.find { |song| song.name == name }
end

def self.find_or_create_by_name(name)
    !self.find_by_name(name) ? self.create(name) : self.find_by_name(name)
end

def self.new_from_filename(filename)
    artist_name = filename.split(' - ')[0]
    song_name = filename.split(' - ')[1]
    genre = filename.split(' - ')[2].delete_suffix!('.mp3')
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre)
    Song.new(song_name, new_artist, new_genre)
end

def self.create_from_filename(filename)
    self.new_from_filename(filename).save
end

end