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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new
    artist_and_name = file_name.split(/\.|\-/)
    song.artist_name = artist_and_name[0].strip
    song.name = artist_and_name[1].strip
    @@all << song
    song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end 

  def self.destroy_all
    self.all.clear
  end

end
