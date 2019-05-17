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
		song = self.new_by_name(name)
		song.save
		song
	end
	
	def self.find_by_name(name)
		self.all.find {|item| item.name == name}
	end
	
	def self.find_or_create_by_name(name)
		if self.find_by_name(name)
			self.find_by_name(name)
		else
			self.create_by_name(name)
		end		
	end
	
	def self.alphabetical
		self.all.sort_by {|item| item.name}
	end
	
	def self.new_from_filename(file)
		song = self.new_by_name(file.split(" - ")[1].chomp(".mp3"))
		song.artist_name = (file.split(" - ")[0])
		song
	end
	
	def self.create_from_filename(file)
		song = self.new_from_filename(file)
		song.save
		song
	end
	
	def self.destroy_all
		self.all.clear
	end
end