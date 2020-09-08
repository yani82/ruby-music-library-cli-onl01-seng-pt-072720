class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        var = Dir.entries(self.path)
        var.shift(2)
        var
    end

    def import
        self.files.each { |file| Song.create_from_filename(file) }
    end

end