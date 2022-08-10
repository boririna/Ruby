class Character
  def initialize
    @character_name = "Camilla"
  end

  def name
    @character_name
  end
end

# Explanation:
#
# We set the instance variable in the constructor
# and return whatever value is set there when someone calls the
# name instance method. The instance variable @name is like a drawer where we
# memorize the name for this character object. There could be many character
# objects that each have their own @name "drawer". Whenever someone creates
# a new character (via Character.new), they get a new object with their own
# @name drawer to store a name value.

# In this case, though, all the objects we create will set the name to "Camilla"
# in their constructor:

character_one = Character.new # set @name to "Camilla"
character_two = Character.new # also sets @name to "Camilla"

character_one.name
# => "Camilla"

character_two.name
# => "Camilla"

# So every character will always be called "Camilla" even though we made
# it more flexible by storing the name in an instance variable @name.
# Right now, noone is able to provide a new name though, even though every
# character object has their own @name drawer to store a different name in theory.
