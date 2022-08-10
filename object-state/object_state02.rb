require "minitest/autorun"

################################################################################
# Extend the class you see here to satisfy the test code.
#
# Only add lines, don't change any lines!
################################################################################

class Character
  def name
    "Lucy"
  end
end

################################################################################
# This is the test testing your code, do not change this.
# After you're done, check solutions/solution_02.rb and compare
# your results.
################################################################################

class ObjectStateTest < Minitest::Test
  def test_02
    character = Character.new

    # What's the easiest/stupidest solution to make this test pass?
    assert_equal "Lucy", character.name
  end
end
