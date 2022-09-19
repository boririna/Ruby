require 'csv'
require_relative 'students'
require_relative 'lectures'
require_relative 'exercises'

# students_csv_content = File.read('students.csv')
# student_lines = students_csv_content.split("\n")

students_csv_content = CSV.read('students.csv')

students = []

students_csv_content[1..-1].each do |row|
  # row = line.split(",")
  student_id = row[0]
  full_name = row[1]
  students << Student.new(student_id, full_name)
end

students[0..4].each do |student|
  student.print_info
end

lectures_csv_content = CSV.read('lectures.csv')

lectures = []

lectures_csv_content[1..-1].each do |row|
  lecture_id = row[0]
  title = row[1]
  level = row[2]
  lectures << Lecture.new(lecture_id, title, level)
end

lectures[0..4].each do |lecture|
  lecture.print_info
end

exercise_csv_content = CSV.read('exercises.csv')

@exercises = []

exercise_csv_content[1..-1].each do |row|
  # exer_student = ""
  exer_student = students.find { |student| row[0] == student.student_id }
  # students.each do |student|
  #   if row[0] == student.student_id
  #     exer_student = student
  #   end
  # end

  exer_lecture = lectures.find { |lecture| row[1] == lecture.lecture_id }
  exercise_name = row[2]
  percentage_achieved = row[3]
  @exercises << Exersise.new(exer_student, exer_lecture, exercise_name, percentage_achieved)
end

@exercises[0..4].each do |exercise|
  exercise.print_info
end

# list the students sorted by number of exercises they submitted
def exercises_for_students(student)
  @total_exercises = []
  @exercises.each do |ex|
    if ex.exer_student == student
      @total_exercises << ex
    end
  end
  @total_exercises
end

students_sorted = students.sort_by { |st| -exercises_for_students(st).length }

students_sorted[0..9].each do |student|
  exercises_for_students(student)
  puts "#{students_sorted.find_index(student) + 1}. #{student.full_name} #{@total_exercises.length}"
end

# The lecture with the highest average percentage
exercises_by_lecture = []
lecture_percentage = []
lectures.each do |lecture|
  # puts lecture.title
  exercises_by_lecture = @exercises.select { |exercise| exercise.exer_lec_id == lecture.lecture_id }
  sum = 0
  i = 0
  exercises_by_lecture.each do |ex|
    sum += ex.percentage_achieved.to_i
    i += 1
  end
  if sum == 0
    puts "#{lecture.lecture_id} average: #{sum}"
  else
    puts "#{lecture.lecture_id} average: #{sum / i}"
  end
end
# exercises_by_lecture.each do |ex|
#   puts "#{ex.exer_lec_id} #{ex.exercise_name} #{ex.percentage_achieved}"
# end
