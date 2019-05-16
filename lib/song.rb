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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    named_song = Song.create
    named_song.name = name
    named_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.to_s.include?(name)}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)

    splitter = filename.split(" - ")
    split_two = splitter[1].split(".")

    song = Song.new

    song.artist_name = splitter[0]
    if split_two.length == 2
      song.name = split_two[0]
    else
      song.name = split_two[0..split_two.length-2].join(".")
    end

    song
  end

  def self.create_from_filename(filename)

    splitter = filename.split(" - ")
    split_two = splitter[1].split(".")

    song = Song.create

    song.artist_name = splitter[0]
    if split_two.length == 2
      song.name = split_two[0]
    else
      song.name = split_two[0..split_two.length-2].join(".")
    end

    song

  end

  def self.destroy_all
    @@all.clear
  end

  def to_s
    "#{@name}"
  end

end
