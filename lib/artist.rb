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

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

    def add_song(song)
        if !song.artist
            song.artist = self
        end
        if !@songs.include?(song)
             @songs << song
        end
    end

    def genres
        self.songs.map { |song| song.genre }.uniq
    end

end