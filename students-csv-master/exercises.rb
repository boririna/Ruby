class Exersise
  attr_reader :average_percentage, :exer_st_id, :exer_lec_id, :exer_student, :exer_lecture, :exercise_name, :percentage_achieved

  def initialize(exer_student, exer_lecture, exercise_name, percentage_achieved)
    @exer_student = exer_student
    @exer_lecture = exer_lecture
    @exercise_name = exercise_name
    @percentage_achieved = percentage_achieved
    @exer_st_id = @exer_student.student_id
    @exer_lec_id = @exer_lecture.lecture_id
  end

  def print_info
    puts "#{@exercise_name} from the lecture #{@exer_lecture.title} is done by a student #{@exer_student.full_name} to a percentage of #{@percentage_achieved}%"
  end
end
