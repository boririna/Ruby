class Character
  def name=(new_name)
    @character_name = new_name
  end

  def name
    @character_name
  end
end

# Explanation:
#
# Now our test first sets a name (with character.name = "Diana") and then
# we create a name method again, with the same implementation as in 03. We return
# the @name instance variable, which stores the name value that the setter
# gave us. The difference between this and 03 is that we do not set
# a name in the constructor (initialize) but only set a name when the
# setter method is called. If noone calls the setter method, the @name instance
# variable is `nil` automatically. So if we do this:

character = Character.new
character.name
# => nil

# We get `nil` back because @name has no value set yet.
# Why is no value set? Because after line 21, only a constructor is called.
# In our case, the constructor is empty, it's basically like this:

class Character
  def initialize
  end
end

# Empty constructors can be omitted, so we didn't write one.

# So now one has to first call our name setter:

character = Character.new
character.name = "This shall be the new name"

# and after this, our @name instance variable stores the string we gave as an
# argument to the setter. So now our @name drawer is filled in with the string
# that we got from the setter method.
