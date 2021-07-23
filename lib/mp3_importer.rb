require 'pry'

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    temp_file = Dir.glob("spec/fixtures/mp3s/*.mp3")
    @files = []

    temp_file.each do |file|
      @files << file.gsub("spec/fixtures/mp3s/", "")
    end

    @files
  end

  def import
    self.files
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end

end 