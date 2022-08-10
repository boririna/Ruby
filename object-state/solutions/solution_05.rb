class Character
  def initialize(name_parameter)
    @character_name = name_parameter
  end

  def name
    @character_name
  end
end

# Explanation:
#
# Now we set the name again in the constructor (initialize), same as in 03, but
# this time it's an argument to the constructor.
#
# In 03 we had this:

character = Character.new

# So a constructor with zero arguments. We just set the name in the constructor
# itself.
# But now we want to provide our new character object with a name that we choose:

character = Character.new("I can give a name that I choose here")

# So we set the @name drawer with a value that is chosen by the first argument
# that is provided. Whatever string we get there we store in the @name instance
# variable (line 3) and return it again when someone calls the name
# getter (line 6)
# The difference here is that we can only set this name once, when creating the
# Character object. At creation we fill in the @character_name drawer (instance variable).
# Once filled in, we can only check what's in the drawer by calling the name method which
# will give us the name that we set when creating it.
