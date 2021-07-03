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
    s = self.new
    s.save
    s
  end

  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end

  def self.create_by_name(song_name)
    s = self.new
    s.name = song_name
    s.save
    s
  end

  def self.find_by_name(song_name)
    self.all.detect {|i| i.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
   if Song.find_by_name(song_name) == nil
     Song.create_by_name(song_name)
   else
     Song.find_by_name(song_name)
   end
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(file_name)
    x = self.new
    x.name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
    x.artist_name = file_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
    x
  end

  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end



end
