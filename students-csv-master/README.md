# Students CSV Exercise

An exercise to read in students, lectures and exercises.

## Download the project

Download the project [here](https://github.com/rubymonstas-zurich/students-csv/archive/master.zip)

## Tasks

1) First, read in all students from the CSV file. Make sure you create an object for each student, i.e. for each row in the CSV file. After you read all the students in, make sure to print them all to the console.

2) Do the same for the lectures as yo did for the students.

3) Now read in all the exercises. You'll find that you only have IDs for students and lectures. Make sure that you initialize the exercise object with a student and a lecture object you loaded in 1) and 2). If you loaded the exercises successfully, make sure to iterate over the exercises (or just a smaller number of them) and print out everything you know about them, e.g. what's the student's name that solved this exercise? What's the lecture title that this exercise was submitted to? Make sure you define a method in the Exercise class that builds this description and call this method when you iterate over the exercises.

4) Not all students did the same amount of exercises. List all the students sorted by the number of exercises they submitted. There's not a single person on the top of this list. What are the names of the students that submitted the most exercises?

5) Bonus: What's the lecture with the highest average percentage achieved? What's the lecture with the lowest percentage achieved?
