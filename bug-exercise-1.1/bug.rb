class Bug
  attr_reader :name, :total_lives
  attr_accessor :remaining_lives

  def initialize(name)
    @name = name
    @total_lives = 10
    @remaining_lives = @total_lives
  end

  def life_expectancy
    self.total_lives
  end

  def alive?
    self.remaining_lives > 0
  end

  def dead?
    self.remaining_lives == 0
  end

  def kill!
    if remaining_lives >= 1
      self.remaining_lives -= 1
    end
  end
end
