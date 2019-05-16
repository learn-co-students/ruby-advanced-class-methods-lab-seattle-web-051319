class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    song = Song.new
    @@all << song
    return song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    return song
  end
  
  def self.create_by_name(name)
    self.new_by_name(name)
  end
  
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end
  
  def self.alphabetical
    return @@all.sort_by {
      |song|
      song.name
    }
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.split(/\.|\-/)
    song = Song.new
    song.name = split_filename[1].strip
    song.artist_name = split_filename[0].strip
    @@all << song
    return song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    @@all.clear
  end
end

# Song.new_from_filename("Thundercat - For Love I Come.mp3")

