require "minitest/autorun"

################################################################################
# Tests

class TravelTest < Minitest::Test
  def self.test_order
    :sorted
  end

  def test_location
  skip # Remove this 'skip' instruction if you want to run the test

    paris = Location.new("Paris", "French", "Euro")

    assert_equal "Paris", paris.name
    assert_equal "French", paris.language
    assert_equal "Euro", paris.currency
  end

  def test_trip_to_paris
    skip # Remove this 'skip' instruction if you want to run the test

    zurich = Location.new("Zurich", "Swiss-German", "Swiss francs")
    paris = Location.new("Paris", "French", "Euro")
    trip = Trip.new(zurich)
    trip.add_stop(paris)

    assert_equal ["Zurich", "Paris", "Zurich"], trip.itinerary
    assert_equal ["Euro"], trip.foreign_currencies
  end

  def test_longer_trip
    skip # Remove this 'skip' instruction if you want to run the test

    trip = Trip.new(Location.new("Zurich", "Swiss-German", "Swiss francs"))
    trip.add_stop(Location.new("Milan", "Italian", "Euro"))
    trip.add_stop(Location.new("Zagreb", "Croatian", "Kuna"))
    trip.add_stop(Location.new("Budapest", "Hungarian", "Forint"))
    trip.add_stop(Location.new("Vienna", "German", "Euro"))

    assert_equal ["Zurich", "Milan", "Zagreb", "Budapest", "Vienna", "Zurich"], trip.itinerary
    assert_equal ["Euro", "Kuna", "Forint"], trip.foreign_currencies
  end
end

################################################################################
# Code under test

# TODO: Implement the code that makes the tests pass here!
