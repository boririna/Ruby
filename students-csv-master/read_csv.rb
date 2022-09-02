require_relative 'students'
require_relative 'lectures'
require_relative 'exercises'

students_csv_content = File.read('students.csv')
# puts students_csv_content
student_lines = students_csv_content.split("\n")

students = []

student_lines[1..-1].each do |line|
  row = line.split(",")
  student_id = row[0]
  full_name = row[1]
  students << Student.new(student_id, full_name)
end

students.each do |student|
  student.print_info
end

lectures_csv_content = File.read('lectures.csv')
lecture_lines = lectures_csv_content.split("\n")

lectures = []

lecture_lines[1..-1].each do |line|
  row = line.split(",")
  lecture_id = row[0]
  title = row[1]
  level = row[2]
  lectures << Lecture.new(lecture_id, title, level)
end

lectures.each do |lecture|
  lecture.print_info
end

exercise_csv_content = File.read('exercises.csv')
exercise_lines = exercise_csv_content.split("\n")

exercises = []

exercise_lines[1..-1].each do |line|
  row = line.split(",")
  exer_student = ""
  students.each do |student|
    if row[0] == student.student_id
      exer_student = student
    end
  end
  exer_lecture = ""
  lectures.each do |lecture|
    if row[1] == lecture.lecture_id
      exer_lecture = lecture
    end
  end
  exercise_name = row[2]
  percentage_achieved = row[3]
  exercises << Exersise.new(exer_student, exer_lecture, exercise_name, percentage_achieved)
end

exercises[0..20].each do |exercise|
  exercise.print_info
end
