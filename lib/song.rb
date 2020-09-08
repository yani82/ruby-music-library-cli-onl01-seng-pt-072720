class Song 
    
    attr_accessor :name, :songs, :artist, :genre 
    
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

    def self.create(song_name)
        song = self.new(song_name)
        song.save
        song
        #new_song = Song.new(name)
        #new_song.save
        #new_song 
    end
    
     def artist=(artist) 
        # @name = name
        # self.artist=(artist) 
        # self.artist = artist if artist != nil #spec line #44
        # self.genre = genre if genre != nil 
        # save
        @artist = artist 
        artist.add_song(self)  
        artist 
    end 
    
    def genre=(genre)
      @genre = genre 
     # genre.add_song(self)
     #genre.songs << genre unless genre.songs.include?(self)
     self.genre.songs << self if !@genre.songs.include?(self)
    end 
    
    def self.find_by_name(name)
      #@@all.detect { |song| song.name == name } 
      self.all.find {|song| song.name == name}
    end 
    
    def self.find_or_create_by_name(name)
      !self.find_by_name(name) ? self.create(name) : self.find_by_name(name)
      # no .all method? 
    end 
    
    def self.new_from_filename(filename)
    artist_name = filename.split(' - ')[0].strip
    song_name = filename.split(' - ')[1].strip
    genre_name = filename.split(' - ')[2].chomp('.mp3')
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, new_artist, genre_name)
    end
    
    # it "initializes a song based on the passed-in filename" do
    #   song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")

    #   expect(song.name).to eq("For Love I Come")
    #   expect(song.artist.name).to eq("Thundercat")
    #   expect(song.genre.name).to eq("dance")
    # end
    
    # expect(song.name).to eq("For Love I Come")
    #   expect(song.artist.name).to eq("Thundercat")
    #   expect(song.genre.name).to eq("dance")
    # end
    
    def self.create_from_filename(filename)
      self.new_from_filename(filename).save
    end 

  end 