class Lecture
  attr_reader :lecture_id, :title, :level

  def initialize(lecture_id, title, level)
    @lecture_id = lecture_id
    @title = title
    @level = level
  end

  def print_info
    puts "Lecture(#{lecture_id}): #{title} #{level}"
  end
end
