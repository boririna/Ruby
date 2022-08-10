require 'minitest/autorun'
require_relative 'hollywood'

# In order to solve the "Hollywood" excercise you don't have to
# edit this file.

class HollywoodTest < Minitest::Test
  def self.test_order
    :sorted
  end

  def setup
    @groundhog_day = Movie.new('Groundhog Day', 1993)
    
    @bill = Actor.new('Bill Murray')
    @andie = Actor.new('Andie MacDowell')

    @bills_character = Character.new(@bill, 'Phil Connors', 'male')
    @andies_character = Character.new(@andie, 'Rita Hanson', 'female')

    @groundhog_day.male_appearance = @bills_character
    @groundhog_day.female_appearance = @andies_character
  end

  def test_actors_names
    assert_equal 'Bill Murray', @bill.name
    assert_equal 'Andie MacDowell', @andie.name
  end

  def test_bills_character
    assert_equal 'Phil Connors', @bills_character.name
    assert_equal 'male', @bills_character.sex
    # If you have trouble getting this next line running,
    # read hint 1 in the hollywood.rb file. But try it on your
    # own first :-)
    assert_equal 'Bill Murray', @bills_character.actor.name
    # we dont test Andie's character (but we could!)
  end

  def test_groundhog_day
    assert_equal 'Groundhog Day', @groundhog_day.name
    assert_equal 1993, @groundhog_day.release_year
    assert_equal 'Rita Hanson', @groundhog_day.female_appearance.name
    assert_equal 'Andie MacDowell', @groundhog_day.female_appearance.actor.name
    # we dont test Bill's character (but we could!)
  end
end
