class Genre 
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
      new_genre = Genre.new(name)
      new_genre.save
      new_genre
    end
    
    #does it need a find_by_name and find_or_create_by_name method?
    
    def artists
      self.songs.map {|song| song.artist}.uniq
      #self.all.select { |artist| artist.genre == self } 
    end 

end 