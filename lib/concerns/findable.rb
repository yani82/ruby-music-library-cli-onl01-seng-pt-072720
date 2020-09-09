module Concerns::Findable
  def find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end

# def self.find_by_name(name)
#       #@@all.detect { |song| song.name == name } 
#       self.all.find {|song| song.name == name}
#     end 
    
#     def self.find_or_create_by_name(name)
#       !self.find_by_name(name) ? self.create(name) : self.find_by_name(name)
#       # no .all method? 
#     end 