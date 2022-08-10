require "minitest/autorun"

################################################################################
# Extend the class you see here to satisfy the test code.
#
# Only add lines, don't change any lines!
################################################################################

class Character
  
  def initialize
    @name = "Camilla"
  end

  def name
    @name
  end
end

################################################################################
# This is the test testing your code, do not change this.
# After you're done, check solutions/solution_03.rb and compare
# your results.
################################################################################

class ObjectStateTest < Minitest::Test
  def test_03
    character = Character.new

    # We now set the name when creating this object.
    # If we call the `name` method on this object
    # we want to have the name returned that is set in the constructor

    assert_equal "Camilla", character.name

    # This next line just checks whether you've implemented it correctly.
    # You're not supposed to understand what's going on here...
    assert_equal character.instance_variable_get("@name").object_id, character.name.object_id
  end
end
