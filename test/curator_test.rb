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
end
# ```markdown
# There are **3** points possible in Iteration 2:
#
# 4. Curator Creation (must include all attributes)
# 5. Curator #add_photograph & Curator #add_artist
# 6. Curator #find_artist_by_id
# ```
#

# photo_1 = Photograph.new({
# id: "1",
# name: "Rue Mouffetard, Paris (Boy with Bottles)",
# artist_id: "1",
# year: "1954"
# })
# # => #<Photograph:0x00007fb3d8ea1cd8...>
#
# photo_2 = Photograph.new({
# id: "2",
# name: "Moonrise, Hernandez",
# artist_id: "2",
# year: "1941"
# })
# # =>
#
# pry(main)> curator.artists
# # => []
#
# artist_1 = Artist.new({
# id: "1",
# name: "Henri Cartier-Bresson",
# born: "1908",
# died: "2004",
# country: "France"
#})
# # => #<Artist:0x00007fb3d8b4ed60...>
#
 # artist_2 = Artist.new({
#     id: "2",
#     name: "Ansel Adams",
#     born: "1902",
#     died: "1984",
#     country: "United States"
# })
# # => #<Artist:0x00007fb3d90bb4b0...>
#
# curator.add_artist(artist_1)
# curator.add_artist(artist_2)

#
# pry(main)> curator.artists
# # => [#<Artist:0x00007fb3d8b4ed60...>, #<Artist:0x00007fb3d90bb4b0...>]
#
# pry(main)> curator.find_artist_by_id("1")
# # => #<Artist:0x00007fb3d8b4ed60...>
