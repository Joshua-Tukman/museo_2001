require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_without_photographs
    curator = Curator.new
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photos
    curator = Curator.new
    photo_1 = Photograph.new({id: "1", name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"})
    photo_2 = Photograph.new({id: "2", name: "Moonrise, Hernandez", artist_id: "2", year: "1941"})
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], curator.photographs
  end

  def test_it_can_add_artists
    curator = Curator.new
    artist_1 = Artist.new({id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"})
    artist_2 = Artist.new({id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"})
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal [artist_1, artist_2], curator.artists
  end

  def test_it_can_find_artist_by_id
    curator = Curator.new
    artist_1 = Artist.new({id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"})
    artist_2 = Artist.new({id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"})
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal artist_1, curator.find_artist_by_id("1")
  end

  def test_it_can_show_photographs_by_artists
    curator = Curator.new

    artist_1 = Artist.new({id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"})
    artist_2 = Artist.new({id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"})
    artist_3 = Artist.new({id: "3", name: "Diane Arbus", born: "1923", died: "1971", country: "United States"})

    photo_1 = Photograph.new({id: "1", name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"})
    photo_2 = Photograph.new({id: "2", name: "Moonrise, Hernandez", artist_id: "2", year: "1941"})
    photo_3 = Photograph.new({id: "3", name: "Identical Twins, Roselle, New Jersey", artist_id: "3", year: "1967"})
    photo_4 = Photograph.new({id: "4", name: "Monolith, The Face of Half Dome", artist_id: "3", year: "1927"})

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expected = {artist_1 => [photo_1], artist_2 => [photo_2], artist_3 => [photo_3, photo_4]}     
    assert_equal expected, curator.photographs_by_artist
  end
end
# There are **3** points possible in Iteration 2:
#
# 7. Curator #photographs_by_artist
# 8. Curator #artists_with_multiple_photographs
# 9. Curator #photographs_taken_by_artist_from
# ```
#
# Use TDD to update your `Curator` class so that is supports the following methods:
#
# * `photographs_by_artist` - This method will return a hash artists as keys, and an array of their photographs as values.
# * `artists_with_multiple_photographs` - This method returns an Array of names of artists who have more than one photograph
# * `photographs_taken_by_artists_from(string)` - This method takes a String representing a country. It returns an Array of `Photograph`s that were taken by a photographer from that country.
#
# The `Curator` class should now respond to the following interaction pattern:



# pry(main)> curator.photographs_by_artist
# # => {
# #        #<Artist:0x00007fabc6a52340...> => [#<Photograph:0x00007fabc6933180...>],
# #        #<Artist:0x00007fabc6c20870...> => [#<Photograph:0x00007fabc6c28e58...>],
# #        #<Artist:0x00007fabc5ba0c70...> => [#<Photograph:0x00007fabc5bb9ef0...>, #<Photograph:0x00007fabc6b931f0...>]
# #      }
#
