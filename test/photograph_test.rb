require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'

class PhotographTest < Minitest::Test

  def test_it_exists
    photograph = Photograph.new({id: "1", name: "Rue Mouffetard, Paris (Boy with Bottles)",
    artist_id: "4", year: "1954"})
    assert_instance_of Photograph, photograph
  end
end
# There are **3** points possible in Iteration 1:
#
# 1.  Artist Creation (must include all attributes)
# 2.  Photograph Creation (must include all attributes)
# 3.  Artist #age_at_death
# ```
#
# Use TDD to create a `Photograph` and an `Artist` class that respond to the following interaction pattern.
#
# For `age_at_death`, assume an artist was born and died on the same day.
#
# ```ruby
# pry(main)> require './lib/photograph'
# #=> true
#
# pry(main)> require './lib/artist'
# #=> true
#
# pry(main)> attributes = {

# }
#
# pry(main)> photograph = Photograph.new(attributes)
# #=> #<Photograph:0x00007fc2d1050c80...>
#
# pry(main)> photograph.id
# #=> "1"
#
# pry(main)> photograph.name
# #=> "Rue Mouffetard, Paris (Boy with Bottles)"
#
# pry(main)> photograph.artist_id
# #=> "4"
#
# pry(main)> photograph.year
# #=> "1954"
#
# pry(main)> attributes = {
#   id: "2",
#   name: "Ansel Adams",
#   born: "1902",
#   died: "1984",
#   country: "United States"
# }
#
# pry(main)> artist = Artist.new(attributes)
# #=> #<Artist:0x00007fc2d0a6c080...>
#
# pry(main)> artist.id
# #=> "2"
#
# pry(main)> artist.name
# #=> "Ansel Adams"
#
# pry(main)> artist.born
# #=> "1902"
#
# pry(main)> artist.died
# #=> "1984"
#
# pry(main)> artist.country
# #=> "United States"
#
# pry(main)> artist.age_at_death
# #=> 82