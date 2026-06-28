-- 1 & 2: View the table (SELECT, FROM)
SELECT student_name, gpa, school_lunch 
FROM students; 

-- 3: Show students who get school lunch (WHERE) 
SELECT student_name, gpa, school_lunch 
FROM students 
WHERE school_lunch = 'Yes' AND gpa >= 3.5; 

-- 4: Sort the students by gpa (ORDER BY) 
SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3 
ORDER BY gpa DESC; 

-- 5: Show the average gpa for each grade level (GROUP BY) 
-- -- Grouping by whatever you want to see in each row, then selecting whatever you're grouping by w/ 
-- -- some aggregation for the data in each group 
SELECT grade_level, AVG(gpa)
FROM students
GROUP BY grade_level
ORDER BY grade_level;

-- 6: Show the grade levels with an average gpa below 3.3 (HAVING) 
SELECT grade_level, AVG(gpa) AS avg_gpa
FROM students
GROUP BY grade_level
HAVING avg_gpa < 3.3 
ORDER BY grade_level;

-- QUERIES HAVE TO BE DONE IN THIS ORDER 
-- SELECT: Choose Columns
-- FROM: Choose Tables 
-- WHERE: Filter Rows 
-- GROUP BY: Group Rows 
-- HAVING: Filter Grouped Rows 
-- ORDER BY: Sort Rows 


-- 7: Special Keywords = LIMIT | COUNT | DISTINCT 
SELECT student_name, gpa, school_lunch 
FROM students
LIMIT 4;

SELECT COUNT(*) -- student_name, gpa, school_lunch 
FROM students 
WHERE school_lunch = 'Yes' AND gpa >= 3.5; 

SELECT DISTINCT gpa
FROM students
ORDER BY gpa DESC;

-- 8: Show the final grades for each student: LEFT JOIN 
SELECT * 
FROM students;

SELECT * 
FROM student_grades;

SELECT students.id, students.student_name, 
	student_grades.class_name, student_grades.final_grade
FROM students LEFT JOIN student_grades
	ON students.id = student_grades.student_id;