require "minitest/autorun"

################################################################################
# Extend the class you see here to satisfy the test code.
#
# Only add lines, don't change any lines!
################################################################################

class Character
  def name=(new_name)
    @name = new_name
  end

  def name
    @name
  end
end

################################################################################
# This is the test testing your code, do not change this.
# After you're done, check solutions/solution_04.rb and compare
# your results.
################################################################################

class ObjectStateTest < Minitest::Test
  def test_04
    character = Character.new

    character.name = "Diana"

    # We now set the name when creating this object.
    # If we call the `name` method on this object
    # we want to have the name returned that is set in the constructor

    assert_equal "Diana", character.name
  end
end
