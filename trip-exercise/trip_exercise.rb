require "minitest/autorun"

################################################################################
# Tests

class TravelTest < Minitest::Test
  def self.test_order
    :sorted
  end

  def test_location
    # Remove this 'skip' instruction if you want to run the test

    paris = Location.new("Paris", "French", "Euro")

    assert_equal "Paris", paris.name
    assert_equal "French", paris.language
    assert_equal "Euro", paris.currency
  end

  def test_trip_to_paris
    # Remove this 'skip' instruction if you want to run the test

    zurich = Location.new("Zurich", "Swiss-German", "Swiss francs")
    paris = Location.new("Paris", "French", "Euro")
    trip = Trip.new(zurich)
    trip.add_stop(paris)

    assert_equal ["Zurich", "Paris", "Zurich"], trip.itinerary
    assert_equal ["Zurich", "Paris", "Zurich"], trip.itinerary
    assert_equal ["Zurich", "Paris", "Zurich"], trip.itinerary
    assert_equal ["Euro"], trip.foreign_currencies
  end

  def test_longer_trip
    # Remove this 'skip' instruction if you want to run the test

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

class Location
  def initialize(name, language, currency)
    @name = name
    @language = language
    @currency = currency
  end

  def name=(new_name)
    @name = new_name
  end

  def language=(new_language)
    @language = new_language
  end

  def currency=(new_currency)
    @currency = new_currency
  end

  def name
    @name
  end

  def language
    @language
  end

  def currency
    @currency
  end
end

class Trip
  def initialize(starting_location)
    @stops = [starting_location]
  end

  def add_stop(location)
    @stops << location
  end

  def itinerary
    itinerary = @stops + [@stops.first]
    # itinerary << @stops.first
    itinerary.map do |stop|
      stop.name
    end
  end

  def foreign_currencies
    # map through @stops
    foreign_currencies = @stops
    (foreign_currencies[1..-1].map do |foreign_currency|
      foreign_currency.currency
    end).uniq
    # output = input.uniq { |x| x[:name] }
    # push currencies to array
    # get rid of the duplicates
    # delete the currency of the starting and ending point since it is not the foreign one
  end
end
