require_relative 'students'
require_relative 'lectures'

students_csv_content = File.read('students.csv')
# puts students_csv_content
lines = students_csv_content.split("\n")

students = []

lines[1..-1].each do |line|
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
