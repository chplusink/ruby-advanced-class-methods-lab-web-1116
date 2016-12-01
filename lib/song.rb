require "pry"

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
    new_song.save
    new_song
  end

  def self.new_by_name(n)
    new_song = self.new
    new_song.name = n
    new_song
  end

  def self.create_by_name(n)
    new_song = self.create
    new_song.name = n
    new_song
  end

  def self.find_by_name(n)
    @@all.find {|a| a.name == n}
  end

  def self.find_or_create_by_name(n)
    if self.find_by_name(n)
      self.find_by_name(n)
    else
      self.create_by_name(n)
    end
  end

  def self.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.parse_filename(filename)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.create
    new_song.parse_filename(filename)
    new_song
  end

  def self.destroy_all
    @@all = []
  end



  ## HELPER METHODS
  def parse_filename(filename)
    self.name = filename.split(" - ").last.gsub(".mp3","")
    self.artist_name = filename.split(" - ").first
  end

end
