require "minitest/autorun"

################################################################################
# Write your code below here:
################################################################################

class Character
end

################################################################################
# This is the test testing your code. Do not change it. What do you have
# to write in order to make this test pass?
#
# Run:
#
#     ruby object_state01.rb
#
# in your terminal.
#
# Without giving you the solution, the test below should tell you what code we
# expect. You should create a Character class. What's the least amount of code
# you have to write to make this code pass?
#
# After you're done, check solutions/solution_01.rb
# to compare your results.
#
################################################################################

class ObjectStateTest < Minitest::Test
  def test_01
    character = Character.new
  end
end
