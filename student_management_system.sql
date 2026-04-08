drop database if exists final_project;
create database final_project;
use final_project;

-- Student Table
create table Students(
	StudentId int primary key,
	FirstName varchar(50),
    LastName varchar(50),
    Email varchar(50),
    BirthDate date,
    EnrollmentDate date
);

-- Departments Table
create table Departments(
	DepartmentId int primary Key,
    DepartmentName varchar(50)
);

-- Course Table
create table Courses(
	CourseId int primary key,
    CourseName varchar(50),
    DepartmentId int,
    Credits int,
    foreign key (DepartmentId) references Departments(DepartmentId)
);

-- Enrollments Table
create table Enrollments(
	EnrollmentId int primary key,
    StudentId int,
    CourseId int,
    EnrollmentDate date,
    foreign key (StudentId) references students(StudentId),
    foreign key (CourseId) references Courses(CourseId)
);

-- Instructors Table
create table Instructors (
	InstructorId int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    DepartmentId int,
    foreign key (DepartmentId) references departments(DepartmentId)
);


-- insert record into Students
insert into students values
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-01', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2023-02-10'),
(3, 'Raj', 'Patel', 'raj.patel@email.com', '2001-09-12', '2021-07-15'),
(4, 'Sara', 'Khan', 'sara.khan@email.com', '2002-03-05', '2023-08-05'),
(5, 'Amit', 'Shah', 'amit.shah@email.com', '2000-11-11', '2020-08-15'),
(6, 'Priya', 'Mehta', 'priya.mehta@email.com', '1998-10-10', '2019-06-20'),
(7, 'Mike', 'Lee', 'mike.lee@email.com', '2003-02-02', '2024-01-10'),
(8, 'Anita', 'Roy', 'anita.roy@email.com', '1997-12-20', '2021-05-05'),
(9, 'Tom', 'White', 'tom.white@email.com', '2002-09-09', '2023-08-01'),
(10, 'Riya', 'Joshi', 'riya.joshi@email.com', '2001-02-18', '2022-07-01');

-- insert record into Departments
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Electronics'),
(5, 'Statistics'),
(6, 'English');

-- insert record into Courses
insert into courses values
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management', 1, 3),
(104, 'Advanced Mathematics', 2, 4),
(105, 'Physics I', 3, 3),
(106, 'Statistics Basics', 5, 3),
(107, 'English Grammar', 6, 2),
(108, 'Electronics Basics', 4, 3);

-- insert record into instructors
insert into instructors values
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'Chirag', 'Shah', 'chirag.shah@univ.com', 1),
(4, 'David', 'Patel', 'david.patel@univ.com', 3),
(5, 'Esha', 'Khan', 'esha.khan@univ.com', 4),
(6, 'Fatima', 'Ansari', 'fatima.ansari@univ.com', 5),
(7, 'George', 'White', 'george.white@univ.com', 2),
(8, 'Helen', 'Roy', 'helen.roy@univ.com', 6);

-- insert record into Enrollments
insert into enrollments values
(1, 1, 101, '2022-08-01'),
(2, 1, 103, '2022-08-10'),
(3, 2, 101, '2023-02-15'),
(4, 2, 102, '2023-03-01'),
(5, 3, 102, '2021-07-20'),
(6, 3, 103, '2021-08-10'),
(7, 4, 101, '2023-08-10'),
(8, 4, 105, '2023-09-01'),
(9, 5, 104, '2020-09-01'),
(10, 5, 106, '2020-09-20'),
(11, 6, 107, '2019-07-01'),
(12, 7, 101, '2024-01-15'),
(13, 7, 108, '2024-02-10'),
(14, 8, 106, '2021-06-01'),
(15, 9, 101, '2023-08-02'),
(16, 9, 102, '2023-08-20'),
(17, 10, 105, '2022-07-10'),
(18, 10, 101, '2022-07-20'),
(19, 5, 108, '2020-10-01'),
(20, 6, 106, '2019-07-10');

-- q1 CRUD OPERATIONS ON ALL TABLE

-- INSERT RECORDS
insert into students values
(11,'Mayur','Makwana','Mayur@update.com','2004-11-06','2024-01-05');

insert into Departments values
(7,'Comm');

insert into courses values
(109,'Acount',7,3);

insert into instructors values
(9,'vishnu','makwana','vishnu@update.com',7);

insert into enrollments values
(21,11,109,'2024-01-05');

-- UPDATE ALL RECORDS
update students set Email='Mayur@gamil.com' where studentid=11;

update Departments set departmentname='commerce' where departmentid=7;

update courses set coursename='Business Accountant' where courseid=109;

update instructors set firstname='vishnubhai' where instructorid=9;

update Enrollments set courseid=106 where enrollmentid=21;

-- GET ALL RECORD
select * from students;

select * from departments;

select * from courses;

select * from instructors;

select * from enrollments;

-- DELETE SPECIFIC RECORD
set foreign_key_checks=0;

delete from students where studentid=11;

delete from departments where departmentid=7;

delete from courses where courseid=109;

delete from  instructors where instructorid=9;

delete from enrollments where enrollmentid=21;

set foreign_key_checks=1;

-- q2 Retrieve students enrolled after 2022
select * 
from students 
where year(enrollmentdate)>2022;

-- q3 Courses offered by Mathematics
select c.coursename,d.departmentname 
from courses c 
join departments d on c.departmentid=d.departmentid 
where d.departmentname='mathematics' 
limit 5;

-- q4 Courses with more than 5 students
select c.coursename,count(e.studentid) as total_students 
from enrollments e 
join courses c on e.courseid=c.courseid
group by c.coursename having total_students>5;

-- q5 Students enrolled in BOTH SQL & Data Structures
-- select s.studentid,s.firstname,c.coursename from enrollments e 
-- join courses c on e.courseid=c.courseid
-- join students s on e.studentid=s.studentid 
-- where s.studentid in 
-- (select e.studentid from enrollments e join courses c on e.courseid=c.courseid where c.coursename='Introduction to SQL')
-- and s.studentid in 
-- (select e.studentid from enrollments e join courses c on e.courseid=c.courseid where c.coursename='Data Structures');

select distinct s.studentid,s.firstname 
from enrollments e 
join courses c on e.courseid=c.courseid
join students s on e.studentid=s.studentid 
where c.coursename in ('Introduction to SQL','Data Structures')
group by s.studentid
having count(distinct c.coursename)=2;

-- q6 Students in SQL OR Data Structures
select distinct s.studentid,s.firstname 
from enrollments e 
join courses c on e.courseid=c.courseid
join students s on e.studentid=s.studentid 
where c.coursename in ('Introduction to SQL','Data Structures');

-- q7 Average credits
select avg(credits) 
from courses;

-- q8 Maximum salary in CS
alter table instructors
add column salary decimal(10,2);

set sql_safe_updates=1;

UPDATE Instructors 
SET Salary = FLOOR(50000 + RAND() * 30000);

select max(i.salary) 
from instructors i 
join departments d on i.departmentid=d.departmentid
where d.departmentname='Computer Science' 
group by i.instructorid;

-- q9 Number of students in each department
select d.departmentname,count(e.studentid) 
from departments d 
join courses c on d.departmentid=c.departmentid
join enrollments e on c.courseid=e.courseid 
group by d.departmentname;

-- q10 INNER JOIN students → courses
select concat_ws(' ',s.firstname,s.lastname) as student_name,c.coursename 
from students s 
join enrollments e on s.studentid=e.studentid
join courses c on e.courseid=c.courseid;

-- q11 LEFT JOIN all students even if not enrolled
select concat_ws(' ',s.firstname,s.lastname) as student_name,c.coursename 
from students s 
left join enrollments e on s.studentid=e.studentid
left join courses c on e.courseid=c.courseid;

-- q12 Courses with more than 10 students
select concat_ws(' ',s.firstname,s.lastname) as student_name,c.coursename 
from students s 
join enrollments e on s.studentid=e.studentid
join courses c on e.courseid=c.courseid 
where c.courseid in (
	select c.courseid 
    from courses c 
    join enrollments e on c.courseid=e.courseid 
    group by c.courseid having count(e.enrollmentid)>5
);

-- q13 Extract year from enrollment
select concat_ws(' ',firstname,lastname) as name,year(enrollmentdate)as enrollmentyear 
from students;

-- q14 Instructor full name
select concat_ws(' ',firstname,lastname) as name 
from instructors;

-- q15 Running total of students
select *,
	count(studentid) over(order by studentid) as run_sum 
from students;

-- q16 Label students as Senior / Junior
select *,
case
	when timestampdiff(year,enrollmentdate,curdate())>4 then 'Senior'
    else 'Junior'
end as student_category
from students;
    
    