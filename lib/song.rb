require 'pry'

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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else 
      new_song = self.create_by_name(name)
      new_song
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    # binding.pry
    filename_array = filename.split(" - ")
    songfile_array = filename_array[1].split(".")

    artist = filename_array[0]
    song = songfile_array[0]
    file_ext = songfile_array[1]

    new_song = self.new_by_name(song)
    new_song.artist_name = artist
    
    new_song
  end


  def self.create_from_filename(filename)
    filename_array = filename.split(" - ")
    songfile_array = filename_array[1].split(".")

    artist = filename_array[0]
    song = songfile_array[0]
    file_ext = songfile_array[1]

    new_song = self.create_by_name(song)
    new_song.artist_name = artist

    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end

# Ways to improve
# #new_from_filename and #create_from_filename can share a helper method