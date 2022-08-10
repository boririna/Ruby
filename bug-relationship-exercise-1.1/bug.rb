class Bug
  attr_reader :name, :total_lives
  attr_accessor :remaining_lives

  def initialize(name)
    @name = name
    @total_lives = 10
    @remaining_lives = @total_lives
    @rel = []
  end

  def relationships
    @rel
  end

  def relationship_summary
    summary = []
    @rel.each do |r|
      s = "#{r.bug1.name} is #{r.bug2.name}'s #{r.kind}"
      summary << s
    end
    ret = summary.join(" and ")
    puts ret
    return ret
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
