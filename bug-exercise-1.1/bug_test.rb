require "minitest/autorun"
require_relative "bug"

# === "A Bug's Life" Exercise ====
#
# This exercise contains 4 predefined tests
# and is supposed to test the code in `bug.rb`.
#
# Try to write the tests **without looking** into the implementation
# of `bug.rb`. Use assertions like
#
# * assert
# * assert_equal
# * (etc. see http://docs.seattlerb.org/minitest/Minitest/Assertions.html for more)
#
# Be aware that `bug.rb` contains actual bugs (!) and you should be able
# to detect them using correct tests.
# You should fix the bugs and make the tests green.
# However, it can be confusing though, but try not to give up. ;-)
#
# Feel free to come up with new features and tests!
#
# Enjoy and good luck!

class BugTest < Minitest::Test
  def self.test_order
    :sorted
  end

  def test_bug_name_is_correct
    # Create a new bug object with `Bug.new(:name)` (where :name should be a string) and test
    # if/that the method `.name` returns your provided name
    bugname = Bug.new("Ladybug")
    
    assert_equal "Ladybug", bugname.name
  end

  def test_a_bugs_life_expectancy
    # Each bug, by default, has 10 lives.
    # Create a new bug with `Bug.new(:name)` and test
    # if/that the `.life_expectancy` is 10
    buglife = Bug.new("Beetle")

    assert_equal 10, buglife.life_expectancy
  end

  def test_a_bug_is_alive_after_creation
    # A bug can be either alive or dead.
    # You can check if the bug is alive/dead with the methods `.alive?` or `.dead?`
    # Create a bug with `Bug.new(:name)` and test
    # if/that the bug is alive at the beginning
    bugalive = Bug.new("Cricket")

    assert_equal true, bugalive.alive?
    assert_equal false, bugalive.dead?
  end

  def test_kill_a_bug_to_death
    # You can kill a bug using the method `.kill!`.
    # You can also check if a bug is dead with `.dead?`,
    # which happens after the bug has been killed 10 times.
    # Create a new bug with `Bug.new(:name)` and kill it 10 times. Then check
    # if/that `.remaining_lives` is 0
    bugkill = Bug.new("Cicada")
    for i in 1..10 do 
      bugkill.kill!
    end

    assert_equal 0, bugkill.remaining_lives
  end
end
