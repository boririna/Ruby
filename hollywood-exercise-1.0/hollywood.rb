# ================================
#     Welcome to Hollywood !
# ================================
#
# This is how this excercise works:
#
# There are two files:
#
# * `hollywood.rb` (this one)
# * `hollywood_test.rb` (the other one)
#
# Both files should be in the same directory!
# Now, in your terminal go into that directory and run the test file, like so:
#
# `ruby hollywood_test.rb`
#
# This should output many things, but most importantly the last
# line should read something like this:
#
# `3 runs, 0 assertions, 0 failures, 3 errors, 0 skips`
#
# ...and this is where our work starts. After succesfully completing
# this excercise the command above shold return
#
# `3 runs, 3 assertions, 0 failures, 0 errors, 0 skips`
#
# And here's what you need to do.
# Below there are **three empty classes**
#
# * `Actor`
# * `Character`
# * `Movie`
#
# Have a look at the `def setup` part in `hollywood_test.rb` in order to get an idea how
# these classes are supposed to be "connected" to each other.
#
# You need to put code into theses classes so that test file passes.
# In order figure out "what" you need to code, try to follow the error messages from the test runs.
# In this way you'll solve the excercise little by little.
# 
# ********** HINTS **************
# 
# Hint 1:
#
# If you have trouble with this line:
# 
# assert_equal 'Bill Murray', @bills_character.actor.name
#
# try to think of what @bills_character.actor should return.
#
class Actor
    attr_reader :name

    def initialize(name)
        @name = name
    end
end

class Character
    attr_reader :actor, :name, :sex

    def initialize(actor, name, sex)
        @actor = actor
        @name = name
        @sex = sex
    end
end

class Movie
    attr_reader :name, :release_year, :male_appearance

    def initialize(name, release_year)
        @name = name
        @release_year = release_year
    end

    def male_appearance=(character)
        @male_appearance = character
    end

    def female_appearance=(char)
        @female_appearance = char
    end

    def female_appearance
        @female_appearance
    end
end
