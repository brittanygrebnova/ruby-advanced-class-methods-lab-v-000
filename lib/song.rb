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
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(song)
    separated = song.split(/[-.]/)
    separated.each do |part|
      separated.pop
      artist_name = separated[0].strip
      name = separated[1].strip
      song = self.new
      binding.pry
      song.artist_name = artist_name
      song.name = name
      end
    song
  end

end

