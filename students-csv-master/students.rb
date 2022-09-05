class Student
  attr_reader :student_id, :full_name

  def initialize(student_id, full_name)
    @student_id = student_id
    @full_name = full_name
  end

  def print_info
    puts "Student(#{student_id}): #{full_name}"
  end

  # def print_sorted
  #   puts "Student(#{student_id}): #{full_name}"
  # end
end
