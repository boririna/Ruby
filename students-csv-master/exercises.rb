
class Exersise
  attr_reader :exer_student, :exer_lecture,:exercise_name, :percentage_achieved
  def initialize(exer_student, exer_lecture, exercise_name, percentage_achieved)
    @exer_student = exer_student
    @exer_lecture = exer_lecture
    # @student_id = @exer_student.student_id
    # @lecture_id = @exer_lecture.lecture_id
    @exercise_name = exercise_name
    @percentage_achieved = percentage_achieved
  end

  def print_info
    puts "The exercise #{@exercise_name} form the lecture #{@exer_lecture.title} is done by a student #{@exer_student.full_name} to a percentage #{@percentage_achieved}"
  end
end
