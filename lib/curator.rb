class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find{|artist| artist.id == id}
  end

  def photographs_by_artist
    collection = {}
    @artists.each do |artist|
      if collection[artist].nil?
        collection[artist] = []
      end
      @photographs.each do |photograph|
        collection[artist] << photograph if photograph.artist_id == artist.id
      end
    end
    collection
  end

  def artists_with_multiple_photographs
    prolific_artists = []
    photographs_by_artist.each do |artist, photo|
      prolific_artists << artist.name if photo.length > 1
    end
    prolific_artists
  end
end
