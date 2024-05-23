    CREATE DATABASE zen;
	use zen;
    CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(15),
    mail VARCHAR(100) NOT NULL,
    qualification VARCHAR(50),
    mentor_id INT,
    course_id INT,
    batch_id INT);
    
    CREATE TABLE mentors (
    mentor_id INT AUTO_INCREMENT PRIMARY KEY,
    mentor_name VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(15),
    mentor_email VARCHAR(100) NOT NULL,
    qualification VARCHAR(50),  
    batch_id INT);
    
    CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL);
    
    CREATE TABLE batches (
    batch_id INT AUTO_INCREMENT PRIMARY KEY,
    batch_num VARCHAR(8),
    mentor_id INT,
    course_id INT);
    
    CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name TEXT NOT NULL,
    task_url TEXT NOT NULL,
    source_code TEXT NOT NULL,
    frontend_url TEXT NOT NULL,
    due_date DATE);
    
    CREATE TABLE dashboard (
    dashboard_id INT AUTO_INCREMENT PRIMARY KEY,
    codekata_marks INT,
    webkata_marks INT,
    submitted_task INT,
    pending_task INT,
    mockinterview_marks INT,
    capstone_marks INT);
    
    CREATE TABLE leaderboard(
    leadeboard_id INT AUTO_INCREMENT PRIMARY KEY,
    learning INT);
    
    CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    present INT,
    absent INT);  
    
    CREATE TABLE capstone (
    capstone_id INT AUTO_INCREMENT PRIMARY KEY,
    pcapstone_name VARCHAR(45),
    capstone_requirements VARCHAR(500));
    
    
    ALTER table batches ADD (start_date DATE);
    
    ALTER TABLE students ADD (
    CONSTRAINT fk_mentor FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT fk_batch FOREIGN KEY (batch_id) REFERENCES batches(batch_id)   
    );
    
      
	ALTER TABLE attendance ADD (
    CONSTRAINT fk_student FOREIGN KEY (student_id) 
    REFERENCES students(student_id),
    CONSTRAINT fk_batch FOREIGN KEY (batch_id) 
    REFERENCES batches(batch_id));

   ALTER TABLE leaderboard ADD ( student_id INT , batch_id INT);
   
    ALTER TABLE leaderboard ADD (
    CONSTRAINT fk_student FOREIGN KEY (student_id) 
    REFERENCES students(student_id),
    CONSTRAINT fk_batch FOREIGN KEY (batch_id) 
    REFERENCES batches(batch_id)
    );
    
    ALTER TABLE leaderboard ADD ( 
   course_id INT,
    CONSTRAINT fk_student FOREIGN KEY (student_id) 
    REFERENCES students(student_id),
    CONSTRAINT fk_course FOREIGN KEY (course_id) 
    REFERENCES courses(course_id),
     CONSTRAINT fk_batch FOREIGN KEY (batch_id) 
    REFERENCES batches(batch_id)
    );
    
    ALTER TABLE tasks ADD ( 
    student_id INT, course_id INT, batch_id INT,
    CONSTRAINT fk_students FOREIGN KEY (student_id) 
    REFERENCES students(student_id),
    CONSTRAINT fk_courses FOREIGN KEY (course_id) 
    REFERENCES courses(course_id),
     CONSTRAINT fk_batches FOREIGN KEY (batch_id) 
    REFERENCES batches(batch_id)
    );
    
    
