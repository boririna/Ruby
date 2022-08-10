class Character
  def name
    "Lucy"
  end
end

# Explanation:
#
# We don't need any variables, we just return the string "Lucy"
# because that is all the test asked from us.
# This implementation is pretty "stupid", but it shows us that
# methods in a class work the same as other methods, they may return
# whatever they want, in this case a static (that means unchangeable) string "Lucy" (line 3).
#
# So when we create a new character with

character = Character.new

# it will return "Lucy" when we call the name instance method:

character.name
# => "Lucy"

# If we create a new character

another_character = Character.new

# it will also return "Lucy", if we ask for its name:

another_character.name
# => "Lucy"

# Because that's what we implemented in line 3. This is not very flexible and
# does not make a lot of sense, but it shows you how classes work.
# The name method always returns "Lucy" because that's how we implemented it.
