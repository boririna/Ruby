require 'csv'
require 'faker'

STUDENT_ID_RANGE = (1..40).to_a

lecture_ids = CSV.open("lectures.csv", headers: true).map { |row| row[0] }

CSV.open("students.csv", "wb") do |csv|
  names = Faker::Name.unique
  csv << ["id", "full_name"]
  STUDENT_ID_RANGE.each do |student_id|
    csv << [student_id, names.name]
  end
end

CSV.open("exercises.csv", "wb") do |csv|
  names = Faker::Name.unique
  csv << ["student_id", "lecture_id", "exercise_name", "percentage_achieved"]
  STUDENT_ID_RANGE.each do |student_id|
    number_of_exercises = rand(100)
    lectures_taken = lecture_ids.sample(number_of_exercises / 10)
    lectures_taken.each do |lecture_id|
      1.upto(10) do |n|
        csv << [student_id, lecture_id, "Exercise #{n}", rand(100)]
      end
    end
  end
end
