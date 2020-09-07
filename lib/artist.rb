class Artist 
   extend Concerns::Findable 
    
    attr_accessor :name, :songs
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end 

    def self.all
      @@all
    end 

    def self.destroy_all
        self.all.clear
    end 
    
    def save 
        @@all << self
    end
    
    # def self.count
    #     self.all.size
    # end 

    def self.create(name)
      # or (artist_name) as argument? 
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end
    
    def add_song(song)
      if !song.artist
        # or add != nil 
        song.artist = self
      end 
      if !@songs.include?(song)
        #unless song.artist.songs.select { |song| song == self }
        @songs << song
      end 
      #song.artist
    end 
    
    #does it need a find_by_name and find_or_create_by_name method?
    
    def genres 
      self.songs.map {|song| song.genre}.uniq
    end 
    
end
