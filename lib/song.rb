require 'pry'
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(name, artist)
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end

  def self.new_by_filename(filename)
    split_name = filename.split(" - ")
    artist = split_name[0]

    create(split_name[1], artist)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

end